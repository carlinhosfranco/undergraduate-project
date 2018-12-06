#!/bin/bash
# Creation: 22/10/2016
# Author: Dalvan Griebler
# Email: dalvangriebler@gmail.com
# Description:	Script for plotting PARSEC-benchmark logs with gnuplot
# Warning: Please configure the script before use it in case there is a different file style of the following:
# ${kernel[$k]}"_"${app[$a]}$w$LOG_EXTENSION -> example -> bodytrack_native3.log
#
#
if [ "$#" -lt 2 ]
then
    echo -e " Error: Please, enter correct arguments as follows:\n $0 <log_dir> <workers_limit>";
    exit 1;
fi

#constant variables
LOG_EXTENSION=".log"; #in case you may change your extension with the following command (from .dat to .log) `for f in *.dat; do mv -- "$f" "${f%.dat}.log"; done`
GNP_DATA_EXTENSION=".dat";
PLOT_DIR="plot";
DAT_DIR="dat";
GNP_DIR="gnp";
LOG_DIR=$1;

#Creating default directories
mkdir -p $PLOT_DIR;
mkdir -p $PLOT_DIR/$DAT_DIR;
mkdir -p $PLOT_DIR/$GNP_DIR;


declare -a app;
declare -a kernel;


app=("native" "KVM");
kernel=("bodytrack" "dedup" "ferret");

declare -a filter;
declare -a filcol;

#filter=("real" "user" "sys");
#filcol=("2" "2" "2");
filter=("real");
filcol=("2");

app_len=${#app[@]};
kernel_len=${#kernel[@]};
filter_len=${#filter[@]};


#filtering all logs
for((f=0;f<${filter_len};f++)) do
	for((k=0;k<${kernel_len};k++)) do
		for((a=0;a<${app_len};a++)) do
			for((w=1; w<=$2; w++)) do
				grep ${filter[$f]} $LOG_DIR/${kernel[$k]}"_"${app[$a]}$w$LOG_EXTENSION |awk -v col=${filcol[$f]} '{ print $col }' | sed -e 's/0m//g' | sed -e 's/s//g' | sed -e 's/m//g' > $LOG_DIR/${kernel[$k]}"-"${app[$a]}$w"-"${filter[$f]}$GNP_DATA_EXTENSION;
			done;
		done;
	done;
done;

#calculating means and stdv
for((f=0;f<${filter_len};f++)) do
	for((k=0;k<${kernel_len};k++)) do
		for((a=0;a<${app_len};a++)) do
			for((w=1; w<=$2; w++)) do
				awk '{sum += $1; y+=$1^2} END {printf '$w'; printf "\t"; printf sum/NR; printf "\t"; print sqrt(y/NR-(sum/NR)^2)}' $LOG_DIR/${kernel[$k]}"-"${app[$a]}$w"-"${filter[$f]}$GNP_DATA_EXTENSION >>  $LOG_DIR/${kernel[$k]}"-"${app[$a]}"-"${filter[$f]}"-means"$GNP_DATA_EXTENSION;
			done;
		done;
	done;
done;

#moving all filtered data
mv $LOG_DIR/*".dat" $PLOT_DIR/$DAT_DIR/

# general plot layout
DATE=`date`;
FONT_SIZE="15";
FONT_TYPE="Helvetica";

LINE_FORMTS="
set xlabel \"Number of Threads\"

set style line 1 lt 1 lc rgb \"#62BCFF\" lw LW				#cyan
set style line 2 lt 2 lc rgb \"#0BA825\" lw LW				#green
set style line 3 lt 3 lc rgb \"#0368FF\" lw LW				#blue
set style line 4 lt 4 lc rgb \"#CB1B00\" lw LW				#red
set style line 5 lt 5 lc rgb \"#000000\" lw LW				#black
set style line 6 lt 6 lc rgb \"#002C64\" lw LW				#blue_dark
set style line 7 lt 7 lc rgb \"#5B9AD1\" lw LW				#blue_light
set style line 8 lt 8 lc rgb \"#A9A9A9\" lw LW				#dark gray
set style line 9 lt 9 lc rgb \"#8A2BE2\" lw LW				#blue violet
set style line 10 lt 10 lc rgb \"#00CED1\" lw LW			#dark turquoise
"

#plotting all means
for((f=0;f<${filter_len};f++)) do
for((k=0;k<${kernel_len};k++)) do
HEADER_PLOT_MEANS="#Author: Dalvan Griebler
#Email: dalvangriebler@gmail.com
#Version: $DATE
set encoding iso_8859_1
set terminal postscript eps solid color font '"$FONT_TYPE","$FONT_SIZE"'
set output '"${kernel[$k]}"-"${filter[$f]}"-means.eps'
set style data dots
set grid
set boxwidth 0.1
LW=2
"$LINE_FORMTS"
#set logscale y 2
set key outside top horizontal nobox font '"$FONT_TYPE","$FONT_SIZE"'
set title '"${kernel[$k]}" ("${filter[$f]}")' offset -2,0,1
"
HEADER_PLOT_MEANS+="set ylabel \"Seconds\" offset 2,1,1 
"
printf "$HEADER_PLOT_MEANS" > $PLOT_DIR/$GNP_DIR/${kernel[$k]}"-"${filter[$f]}"-means.gnp";

PLOTING_STR="plot ";
for((a=0;a<${app_len};a++)) do
	if [ $a == 0 ]
	then
		PLOTING_STR+="'../"$DAT_DIR"/"${kernel[$k]}"-"${app[$a]}"-"${filter[$f]}"-means"$GNP_DATA_EXTENSION"' using 1:2:xtic(1) with linespoints ls "$(($a+1))" title \""${app[$a]}"\" axes x1y1,'' using 1:2:3 with errorbars ls "$(($a+1))" notitle\\";
	else
		PLOTING_STR+="
	,'../"$DAT_DIR"/"${kernel[$k]}"-"${app[$a]}"-"${filter[$f]}"-means"$GNP_DATA_EXTENSION"' using 1:2:xtic(1) with linespoints ls "$(($a+1))" title \""${app[$a]}"\" axes x1y1,'' using 1:2:3 with errorbars ls "$(($a+1))" notitle\\";
	fi
done;
printf "$PLOTING_STR" >> $PLOT_DIR/$GNP_DIR/${kernel[$k]}"-"${filter[$f]}"-means.gnp";
printf "
" >> $PLOT_DIR/$GNP_DIR/${kernel[$k]}"-"${filter[$f]}"-means.gnp";
done;
done;

#generating all graphs 
cd $PLOT_DIR/$GNP_DIR
`gnuplot *.gnp`;

#converting eps to pdf
`find . -name "*.eps" -exec epstopdf {} ";"`

#removing eps
`rm -rf *.eps`