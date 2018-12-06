set terminal postscript eps enhanced solid color font 'Helvetica,15'
set output 'all_MPI_speedup.eps'
set style data dots
set encoding utf8
set key outside left bottom horizontal Left reverse enhanced autotitles nobox
set grid
set boxwidth 0.1
set xrange [1:16.5]
set yrange [0:16]
set y2range [0:1]

set xlabel "Número de Threads"
set ylabel "Speedup" offset 1,1,1


set style fill transparent pattern 6 bo

set style line 1 lt 1 lc rgb "#FF0000" lw 1.5           #red
set style line 2 lt 3 lc rgb "#8B0000" lw 1.5           #darkred
set style line 3 lt 3 lc rgb "#DC143C" lw 1.5           #crison
set style line 4 lt 4 lc rgb "#800000" lw 1.5           #maroon
#OpenNebula
set style line 6 lt 1 lc rgb "#000080" lw 1.5           #navy
set style line 7 lt 3 lc rgb "#4169E1" lw 1.5           #navy_blue
set style line 8 lt 3 lc rgb "#1E90FF" lw 1.5           #dodgerblue
set style line 9 lt 4 lc rgb "#0000FF" lw 1.5           #blue
#Environment
set style line 10 lt 1 lc rgb "#228B22" lw 1.5           #forestgreen
set style line 11 lt 3 lc rgb "#006400" lw 1.5           #darkgree
set style line 12 lt 3 lc rgb "#008000" lw 1.5           #green
set style line 13 lt 4 lc rgb "#3CB371" lw 1.5           #mediumseagreen
#for than on graph
#set multiplot layout 3,3

set title "NPB-MPI-OpenNebula (Speedup)" 

plot 'BT-B_speedup.dat' using 1:1:xtic(1) with linespoints ls 3 title "Ideal" axes x1y1\
	,'BT-B_speedup.dat' using 1:2 with linespoints ls 4 title "BT" axes x1y1, '' using 1:($2+0.1):2 with labels center offset 0,0.3 font 'Helvetica,10' notitle axes x1y1\
	,'CG-B_speedup.dat' using 1:2 with linespoints ls 12 title "CG" axes x1y1, '' using 1:($2+0.1):2 with labels center offset 0,0.3 font 'Helvetica,10' notitle axes x1y1\
	,'EP-B_speedup.dat' using 1:2 with linespoints ls 5 title "EP" axes x1y1, '' using 1:($2+0.1):2 with labels center offset 0,0.3 font 'Helvetica,10' notitle axes x1y1\
	,'FT-B_speedup.dat' using 1:2 with linespoints ls 6 title "FT" axes x1y1, '' using 1:($2+0.1):2 with labels center offset 0,0.3 font 'Helvetica,10' notitle axes x1y1\
	,'IS-B_speedup.dat' using 1:2 with linespoints ls 7 title "IS" axes x1y1, '' using 1:($2+0.1):2 with labels center offset 0,0.3 font 'Helvetica,10' notitle axes x1y1\
	,'LU-B_speedup.dat' using 1:2 with linespoints ls 8 title "LU" axes x1y1, '' using 1:($2+0.1):2 with labels center offset 0,0.3 font 'Helvetica,10' notitle axes x1y1\
	,'MG-B_speedup.dat' using 1:2 with linespoints ls 9 title "MG" axes x1y1, '' using 1:($2+0.1):2 with labels center offset 0,0.3 font 'Helvetica,10' notitle axes x1y1\
	,'SP-B_speedup.dat' using 1:2 with linespoints ls 10 title "SP" axes x1y1, '' using 1:($2+0.1):2 with labels center offset 0,0.3 font 'Helvetica,10' notitle axes x1y1
#unset multiplot
