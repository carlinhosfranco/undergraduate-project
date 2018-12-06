set terminal postscript eps enhanced solid color font 'Helvetica,15'
set output 'all_MPI_averagetime.eps'
set style data dots
set encoding utf8
set key outside left bottom horizontal Left reverse enhanced autotitles nobox
set grid ytics 
set boxwidth 0.3
set xrange [0:17]
set yrange [0:680]
set ytics 0,25
set mytics 5
#set y2range [0:1]

set ylabel "Tempo (s)" offset 1,1,1
set xlabel "Número de Threads"

set style fill transparent pattern 6 bo

set style line 1 lt 1 lc rgb "#002C64" lw 3		#blue_marinho
set style line 2 lt 2 lc rgb "#5B9AD1" lw 3		#blue_claro
set style line 3 lt 3 lc rgb "#000000" lw 3		#black
set style line 4 lt 4 lc rgb "#0000FF" lw 3		#blue
   
set style line 7 lt 1 lc rgb "#2E8B57" lw 3
set style line 6 lt 1 lc rgb "#FF0000" lw 3

#for than on graph
#set multiplot layout 3,3

set title "NPB-MPI-OpenNebula (Tempo Médio)" 

plot 'BT-B_averagetime.dat' using 1:2:xtic(1) with linespoints ls 1 title "BT" axes x1y1, '' using 1:2:2 with labels center offset 0,0.3 font 'Helvetica,12' notitle axes x1y1\
	,'CG-B_averagetime.dat' using 1:2:xtic(1) with linespoints ls 2 title "CG" axes x1y1, '' using 1:2:2 with labels center offset 0,0.3 font 'Helvetica,12' notitle axes x1y1\
	,'EP-B_averagetime.dat' using 1:2:xtic(1) with linespoints ls 3 title "EP" axes x1y1, '' using 1:2:2 with labels center offset 0,0.3 font 'Helvetica,12' notitle axes x1y1\
	,'FT-B_averagetime.dat' using 1:2:xtic(1) with linespoints ls 4 title "FT" axes x1y1, '' using 1:2:2 with labels center offset 0,0.3 font 'Helvetica,12' notitle axes x1y1\
	,'IS-B_averagetime.dat' using 1:2:xtic(1) with linespoints ls 5 title "IS" axes x1y1, '' using 1:2:2 with labels center offset 0,0.3 font 'Helvetica,12' notitle axes x1y1\
	,'LU-B_averagetime.dat' using 1:2:xtic(1) with linespoints ls 6 title "LU" axes x1y1, '' using 1:2:2 with labels center offset 0,0.3 font 'Helvetica,12' notitle axes x1y1\
	,'MG-B_averagetime.dat' using 1:2:xtic(1) with linespoints ls 7 title "MG" axes x1y1, '' using 1:2:2 with labels center offset 0,0.3 font 'Helvetica,12' notitle axes x1y1\
	,'SP-B_averagetime.dat' using 1:2:xtic(1) with linespoints ls 8 title "SP" axes x1y1, '' using 1:2:2 with labels center offset 0,0.3 font 'Helvetica,12' notitle axes x1y1\

#unset multiplot
