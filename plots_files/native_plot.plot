set terminal postscript eps enhanced solid color font 'Helvetica,15'
set output 'native.eps'
set style data dots
set encoding iso_8859_1
#set encoding utf8
#set key outside left bottom horizontal Left reverse enhanced autotitles nobox
set grid
set boxwidth 0.1
set xrange [0:5]
#set x2range [0:2]
#set xtics  1
#set yrange [0:10]
#set y2range [0:200]
#set y3range [0:200]
#set ytics 0,2
#set mytics 5

#OpenNebula
set style line 1 lt 1 lc rgb "#FF0000" lw 1.5           #red
set style line 2 lt 3 lc rgb "#8B0000" lw 1.5           #darkred
set style line 3 lt 3 lc rgb "#DC143C" lw 1.5           #crison
set style line 4 lt 4 lc rgb "#800000" lw 1.5           #maroon
#OpenNebula
set style line 6 lt 6 lc rgb "#000080" lw 1.5           #navy
set style line 7 lt 3 lc rgb "#4169E1" lw 1.5           #navy_blue
set style line 8 lt 3 lc rgb "#1E90FF" lw 1.5           #dodgerblue
set style line 9 lt 4 lc rgb "#0000FF" lw 1.5           #blue
#Environment
set style line 10 lt 1 lc rgb "#228B22" lw 1.5           #forestgreen
set style line 11 lt 3 lc rgb "#006400" lw 1.5           #darkgree
set style line 12 lt 3 lc rgb "#008000" lw 1.5           #green
set style line 13 lt 4 lc rgb "#0000" lw 1.5           #mediumseagreen


set style fill solid 0.5 border 
#set style fill transparent pattern 6 border
#for than on graph
#set style fill solid 0.25 border
set multiplot layout 2,2

set key outside horizontal nobox reverse font 'Helvetica,12'

set title "(2) Média IOZONE"
set ylabel "Kbytes/s" offset 3,1,1
set xtics ("Write" 1, "Read" 2, "ReWrite" 3, "ReRead" 4) 
#set style fill transparent pattern 3 border
plot	'./OpenNebula/environment_dats/iozone.dat' using 1:2 with boxes ls 6 title "OpenNebula" axes x1y1\
	,'./OpenStack/environment_dats/iozone.dat' using ($1+0.2):2 with boxes ls 1 title "OpenStack" axes x1y1\
	#,'./Native/environment_dats/iozone.dat' using ($1+0.4):2 with boxes ls 12 title "Nativo" axes x1y1\
	,'./OpenNebula/environment_dats/iozone.dat' using ($1+1):3 with boxes ls 6 notitle "OpenNebula(Read)" axes x1y1\
	,'./OpenStack/environment_dats/iozone.dat' using ($1+1.2):3 with boxes ls 1 notitle "OpenStack(Read)" axes x1y1\
	#,'./Native/environment_dats/iozone.dat' using ($1+1.4):3 with boxes ls 12 notitle "Nativo(Read)" axes x1y1\
	,'./OpenNebula/environment_dats/iozone.dat' using ($1+2):4 with boxes ls 6 notitle "OpenNebula(ReWrite)" axes x1y1\
	,'./OpenStack/environment_dats/iozone.dat' using ($1+2.2):4 with boxes ls 1 notitle "OpenStack(ReWrite)" axes x1y1\
	#,'./Native/environment_dats/iozone.dat' using ($1+2.4):4 with boxes ls 12 notitle "Nativo(ReWrite)" axes x1y1\
	,'./OpenNebula/environment_dats/iozone.dat' using ($1+3):5 with boxes ls 6 notitle "OpenNebula(ReRead)" axes x1y1\
	,'./OpenStack/environment_dats/iozone.dat' using ($1+3.2):5 with boxes ls 1 notitle "OpenStack(ReRead)" axes x1y1
	#,'./Native/environment_dats/iozone.dat' using ($1+3.4):5 with boxes ls 12 notitle "Nativo(ReRead)" axes x1y1

#set key inside left vertical nobox font 'Helvetica,12'
set title "(1) Média STREAM"
set ylabel "Mbytes/s" offset 1,1,1
set xtics ("ADD" 1, "Copy" 2, "Scale" 3, "Triad" 4) font 'Helvetica,12'
#set key inside left top vertical center reverse enhanced autotitles nobox
set tmargin 2
set bmargin 1
set lmargin 9
set rmargin 1
#set style fill transparent pattern 3 border
plot    './OpenNebula/environment_dats/stream.dat' using 1:2 with boxes ls 6 title "OpenNebula(ADD)" axes x1y1\
                ,'./OpenStack/environment_dats/stream.dat' using ($1+0.2):2 with boxes ls 1 title "OpenStack(ADD)" axes x1y1\
                #,'./Native/environment_dats/stream.dat' using ($1+0.4):2 with boxes ls 12 title "Nativo(ADD)" axes x1y1\
                ,'./OpenNebula/environment_dats/stream.dat' using ($1+1):3 with boxes ls 6 notitle "OpenNebula(COPY)" axes x1y1\
                ,'./OpenStack/environment_dats/stream.dat' using ($1+1.2):3 with boxes ls 1 notitle "OpenStack(COPY)" axes x1y1\
                #,'./Native/environment_dats/stream.dat' using ($1+1.4):3 with boxes ls 12 notitle "Nativo(COPY)" axes x1y1\
                ,'./OpenNebula/environment_dats/stream.dat' using ($1+2):4 with boxes ls 6 notitle "OpenNebula(SCALE)" axes x1y1\
                ,'./OpenStack/environment_dats/stream.dat' using ($1+2.2):4 with boxes ls 1 notitle "OpenStack(SCALE)" axes x1y1\
                #,'./Native/environment_dats/stream.dat' using ($1+2.4):4 with boxes ls 12 notitle "Nativo(SCALE)" axes x1y1\
                ,'./OpenNebula/environment_dats/stream.dat' using ($1+3):5 with boxes ls 6 notitle "OpenNebula(TRIADE)" axes x1y1\
                ,'./OpenStack/environment_dats/stream.dat' using ($1+3.2):5 with boxes ls 1 notitle "OpenStack(TRIADE)" axes x1y1
                #,'./Native/environment_dats/stream.dat' using ($1+3.4):5 with boxes ls 12 notitle "Nativo(TRIADE)" axes x1y1

set tmargin 3
set bmargin 2
set lmargin 9
set rmargin 1 
set title "(3) Média Linpack"
set ylabel "KFLOPS" offset 3,1,1
set xtics ("Multiplicação de Matrizes" 1) 
set yrange [10:*]
set xrange [0:2]
#set key inside left vertical nobox font 'Helvetica,12'
#set style fill transparent pattern 3 border
plot './OpenNebula/environment_dats/linpack.dat' using 1:2 with boxes ls 6 title "OpenNebula" axes x1y1\
	,'./OpenStack/environment_dats/linpack.dat' using ($1+0.4):2 with boxes ls 1 title "OpenStack" axes x1y1
	#,'./Native/environment_dats/linpack.dat' using ($1+0.6):2 with boxes ls 12 title "Nativo" axes x1y1
set tmargin 3
set bmargin 2
set lmargin 5
set rmargin 1
set title "(4) Média IPERF"
set ylabel "Mbits/s" offset 3,1,1
set xtics ("Throughput" 1)

#set label "OpenNebula" at 0.1,750 textcolor ls 6
#set label "OpenStack" at 0.1,650 textcolor ls 1
#set style fill transparent pattern 3 border
#set key outside center bottom horizontal Left reverse enhanced nobox font 'Helvetica,12'
#set key inside left vertical nobox font 'Helvetica,12'
plot	'./OpenNebula/environment_dats/iperf.dat' using ($1+0.2):2 with boxes ls 6 title "OpenNebula" axes x1y1\
	,'./OpenStack/environment_dats/iperf.dat' using ($1+0.4):2 with boxes ls 1 title "OpenStack" axes x1y1
	#,'./Native/environment_dats/iperf.dat' using ($1+0.6):2 with boxes ls 12 title "Nativo" axes x1y1
#set key outside center bottom horizontal Left reverse enhanced autotitles nobox font 'Helvetica,10'

unset multiplot
