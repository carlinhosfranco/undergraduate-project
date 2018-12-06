#!/bin/bash
#Carlos Alberto Franco Maron; Dalvan Griebler
#Script para execucao dos benchmarks OpenMP.
# Start in 23-05-2014
# Ultima atualização: 15/10/15
CONT=1
BTB_OMP="/mnt/nfs/home/wcp/NPB3.3/NPB3.3-OMP/bin/bt.B"
CGB_OMP="/mnt/nfs/home/wcp/NPB3.3/NPB3.3-OMP/bin/cg.B"
DCB_OMP="/mnt/nfs/home/wcp/NPB3.3/NPB3.3-OMP/bin/dc.B"
EPB_OMP="/mnt/nfs/home/wcp/NPB3.3/NPB3.3-OMP/bin/ep.B"
FTB_OMP="/mnt/nfs/home/wcp/NPB3.3/NPB3.3-OMP/bin/ft.B"
ISB_OMP="/mnt/nfs/home/wcp/NPB3.3/NPB3.3-OMP/bin/is.B"
LUB_OMP="/mnt/nfs/home/wcp/NPB3.3/NPB3.3-OMP/bin/lu.B"
MGB_OMP="/mnt/nfs/home/wcp/NPB3.3/NPB3.3-OMP/bin/mg.B"
SPB_OMP="/mnt/nfs/home/wcp/NPB3.3/NPB3.3-OMP/bin/sp.B"
UAB_OMP="/mnt/nfs/home/wcp/NPB3.3/NPB3.3-OMP/bin/ua.B"

#---------------------------------------------------------------
#Array que define a chamada de cada função para a execução de cada kernel do NAS. 
#---------------------------------------------------------------

#array=( "btb_omp" "cgb_omp" "dcb_omp" "epb_omp" "ftb_omp" "isb_omp" "lub_omp" "mgb_omp" "spb_omp" "uab_omp" )
array=( "btb_omp" "cgb_omp" "epb_omp" "ftb_omp" "isb_omp" "lub_omp" "mgb_omp" "spb_omp" "uab_omp" )
#array=( "epb_omp" "ftb_omp" "isb_omp" "mgb_omp" )


#---------------------------------------------------------------
#Inicio das definições das funções
#---------------------------------------------------------------

btb_omp()
{
	export OMP_NUM_THREADS=$THREADS
	echo "-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-" >> /mnt/nfs/home/wcp/logs/bt.B.$OMP_NUM_THREADS.log
	echo Start in `date +%H:%M:%S--%d/%m/%Y` 2>&1>> /mnt/nfs/home/wcp/logs/bt.B.$OMP_NUM_THREADS.log
	$BTB_OMP >> /mnt/nfs/home/wcp/logs/bt.B.$OMP_NUM_THREADS.log
	echo Finish in `date +%H:%M:%S--%d/%m/%Y` 2>&1>> /mnt/nfs/home/wcp/logs/bt.B.$OMP_NUM_THREADS.log
	echo "-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-" >> /mnt/nfs/home/wcp/logs/bt.B.$OMP_NUM_THREADS.log
}

cgb_omp()
{
	export OMP_NUM_THREADS=$THREADS
	echo "-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-" >> /mnt/nfs/home/wcp/logs/cg.B.$OMP_NUM_THREADS.log
	echo Start in `date +%H:%M:%S--%d/%m/%Y` 2>&1>> /mnt/nfs/home/wcp/logs/cg.B.$OMP_NUM_THREADS.log
	$CGB_OMP >> /mnt/nfs/home/wcp/logs/cg.B.$OMP_NUM_THREADS.log
	echo Finish in `date +%H:%M:%S--%d/%m/%Y` 2>&1>> /mnt/nfs/home/wcp/logs/cg.B.$OMP_NUM_THREADS.log
	echo "-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-" >> /mnt/nfs/home/wcp/logs/cg.B.$OMP_NUM_THREADS.log
}

dcb_omp()
{
	export OMP_NUM_THREADS=$THREADS
	echo "-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-" >> /mnt/nfs/home/wcp/logs/dc.B.$OMP_NUM_THREADS.log
	echo Start in `date +%H:%M:%S--%d/%m/%Y` 2>&1>> /mnt/nfs/home/wcp/logs/dc.B.$OMP_NUM_THREADS.log
	$DCB_OMP >> /mnt/nfs/home/wcp/logs/dc.B.$OMP_NUM_THREADS.log
	echo Finish in `date +%H:%M:%S--%d/%m/%Y` 2>&1>> /mnt/nfs/home/wcp/logs/cg.B.$OMP_NUM_THREADS.log
	echo "-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-" >> /mnt/nfs/home/wcp/logs/dc.B.$OMP_NUM_THREADS.log
}

epb_omp()
{
	export OMP_NUM_THREADS=$THREADS
	echo "-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-" >> /mnt/nfs/home/wcp/logs/ep.B.$OMP_NUM_THREADS.log
	echo Start in `date +%H:%M:%S--%d/%m/%Y` 2>&1>> /mnt/nfs/home/wcp/logs/ep.B.$OMP_NUM_THREADS.log
	$EPB_OMP >> /mnt/nfs/home/wcp/logs/ep.B.$OMP_NUM_THREADS.log
	echo Finish in `date +%H:%M:%S--%d/%m/%Y` 2>&1>> /mnt/nfs/home/wcp/logs/ep.B.$OMP_NUM_THREADS.log
	echo "-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-" >> /mnt/nfs/home/wcp/logs/ep.B.$OMP_NUM_THREADS.log
}

ftb_omp()
{
	export OMP_NUM_THREADS=$THREADS
	echo "-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-" >> /mnt/nfs/home/wcp/logs/ft.B.$OMP_NUM_THREADS.log
	echo Start in `date +%H:%M:%S--%d/%m/%Y` 2>&1>> /mnt/nfs/home/wcp/logs/ft.B.$OMP_NUM_THREADS.log
	$FTB_OMP >> /mnt/nfs/home/wcp/logs/ft.B.$OMP_NUM_THREADS.log
	echo Finish in `date +%H:%M:%S--%d/%m/%Y` 2>&1>> /mnt/nfs/home/wcp/logs/ft.B.$OMP_NUM_THREADS.log
	echo "-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-" >> /mnt/nfs/home/wcp/logs/ft.B.$OMP_NUM_THREADS.log
}

isb_omp()
{
	export OMP_NUM_THREADS=$THREADS
	echo "-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-" >> /mnt/nfs/home/wcp/logs/is.B.$OMP_NUM_THREADS.log
	echo Start in `date +%H:%M:%S--%d/%m/%Y` 2>&1>> /mnt/nfs/home/wcp/logs/is.B.$OMP_NUM_THREADS.log
	$ISB_OMP >> /mnt/nfs/home/wcp/logs/is.B.$OMP_NUM_THREADS.log
	echo Finish in `date +%H:%M:%S--%d/%m/%Y` 2>&1>> /mnt/nfs/home/wcp/logs/is.B.$OMP_NUM_THREADS.log
	echo "-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-" >> /mnt/nfs/home/wcp/logs/is.B.$OMP_NUM_THREADS.log
}

lub_omp()
{
	export OMP_NUM_THREADS=$THREADS
	echo "-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-" >> /mnt/nfs/home/wcp/logs/lu.B.$OMP_NUM_THREADS.log
	echo Start in `date +%H:%M:%S--%d/%m/%Y` 2>&1>> /mnt/nfs/home/wcp/logs/lu.B.$OMP_NUM_THREADS.log
	$LUB_OMP >> /mnt/nfs/home/wcp/logs/lu.B.$OMP_NUM_THREADS.log
	echo Finish in `date +%H:%M:%S--%d/%m/%Y` 2>&1>> /mnt/nfs/home/wcp/logs/lu.B.$OMP_NUM_THREADS.log
	echo "-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-" >> /mnt/nfs/home/wcp/logs/lu.B.$OMP_NUM_THREADS.log
}

mgb_omp()
{
	export OMP_NUM_THREADS=$THREADS
	echo "-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-" >> /mnt/nfs/home/wcp/logs/mg.B.$OMP_NUM_THREADS.log
	echo Start in `date +%H:%M:%S--%d/%m/%Y` 2>&1>> /mnt/nfs/home/wcp/logs/mg.B.$OMP_NUM_THREADS.log
	$MGB_OMP >> /mnt/nfs/home/wcp/logs/mg.B.$OMP_NUM_THREADS.log
	echo Finish in `date +%H:%M:%S--%d/%m/%Y` 2>&1>> /mnt/nfs/home/wcp/logs/mg.B.$OMP_NUM_THREADS.log
	echo "-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-" >> /mnt/nfs/home/wcp/logs/mg.B.$OMP_NUM_THREADS.log
}

spb_omp()
{
	export OMP_NUM_THREADS=$THREADS
	echo "-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-" >> /mnt/nfs/home/wcp/logs/sp.B.$OMP_NUM_THREADS.log
	echo Start in `date +%H:%M:%S--%d/%m/%Y` 2>&1>> /mnt/nfs/home/wcp/logs/sp.B.$OMP_NUM_THREADS.log
	$SPB_OMP >> /mnt/nfs/home/wcp/logs/sp.B.$OMP_NUM_THREADS.log
	echo Finish in `date +%H:%M:%S--%d/%m/%Y` 2>&1>> /mnt/nfs/home/wcp/logs/sp.B.$OMP_NUM_THREADS.log
	echo "-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-" >> /mnt/nfs/home/wcp/logs/sp.B.$OMP_NUM_THREADS.log
}

uab_omp()
{
	export OMP_NUM_THREADS=$THREADS
	echo "-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-" >> /mnt/nfs/home/wcp/logs/ua.B.$OMP_NUM_THREADS.log
	echo Start in `date +%H:%M:%S--%d/%m/%Y` 2>&1>> /mnt/nfs/home/wcp/logs/ua.B.$OMP_NUM_THREADS.log
	$UAB_OMP >> /mnt/nfs/home/wcp/logs/ua.B.$OMP_NUM_THREADS.log
	echo Finish in `date +%H:%M:%S--%d/%m/%Y` 2>&1>> /mnt/nfs/home/wcp/logs/ua.B.$OMP_NUM_THREADS.log
	echo "-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-" >> /mnt/nfs/home/wcp/logs/ua.B.$OMP_NUM_THREADS.log
}

#---------------------------------------------------------------
#Fim das definições das funções
#---------------------------------------------------------------

###################################################################################################

#---------------------------------------------------------------
#Inicio do código da execução
#
#O primeiro for determina a quantidade de threads durante a execução.
#
#O Segundo for determina a quantidade de execução de cada kernel
#
#O Terceiro FOR chama cada função  definida dentro do array. 
#---------------------------------------------------------------


for((THREADS=1;THREADS<3;THREADS++))
do
	for((CONT=1;CONT<3;CONT++))
	do
		for((AUX=0;AUX<=${#array[@]};AUX++))
		do
			echo ${array[$AUX]}
			echo cont $CONT
			echo th $THREADS
			#${array[$AUX]}
			sleep 1;
		done
	done
done
