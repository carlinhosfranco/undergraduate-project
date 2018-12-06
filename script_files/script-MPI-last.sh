#!/bin/bash

BTB_MPI="/mnt/nfs/home/wcp/NPB3.3/NPB3.3-MPI/bin/bt.B"
CGB_MPI="/mnt/nfs/home/wcp/NPB3.3/NPB3.3-MPI/bin/cg.B"
DTB_MPI="/mnt/nfs/home/wcp/NPB3.3/NPB3.3-MPI/bin/dt.B"
EPB_MPI="/mnt/nfs/home/wcp/NPB3.3/NPB3.3-MPI/bin/ep.B"
FTB_MPI="/mnt/nfs/home/wcp/NPB3.3/NPB3.3-MPI/bin/ft.B"
ISB_MPI="/mnt/nfs/home/wcp/NPB3.3/NPB3.3-MPI/bin/is.B"
LUB_MPI="/mnt/nfs/home/wcp/NPB3.3/NPB3.3-MPI/bin/lu.B"
MGB_MPI="/mnt/nfs/home/wcp/NPB3.3/NPB3.3-MPI/bin/mg.B"
SPB_MPI="/mnt/nfs/home/wcp/NPB3.3/NPB3.3-MPI/bin/sp.B"

NUM_RPT="41" #Definir quantas repetições


#---------------------------------------------------------------
#Array que define a chamada de cada função que executa o kernel do NAS.
#---------------------------------------------------------------
#array=( "exec1" "exec2" "exec4" "exec8" "exec9" "exec16" "exec18" "exec20" "exec24" )
#array=( "exec24" )
array=( "exec1" "exec2" "exec4" "exec8" "exec9" "exec16" )

#---------------------------------------------------------------
#Inicio das definições das funções
#---------------------------------------------------------------
#Importante: Cada função foi feita para ser executada independente. Ou seja, cada função controla a quantidade de
#processos a ser executado e quais kernels.
#Essas funções são identificadas pela quantidade de processos. O primeiro FOR dentro das funções, determina as repetições
#de cada kernel. O segundo FOR chama o array que executa cada kernel da suite MPI
#
exec1()
{

PROCESS="1"
#arrayexec1=( "$EPB_MPI.$PROCESS" "$FTB_MPI.$PROCESS" "$ISB_MPI.$PROCESS" "$MGB_MPI.$PROCESS" )
arrayexec1=("$SPB_MPI.$PROCESS" "$BTB_MPI.$PROCESS" "$CGB_MPI.$PROCESS" "$EPB_MPI.$PROCESS" "$FTB_MPI.$PROCESS" "$ISB_MPI.$PROCESS" "$LUB_MPI.$PROCESS"
"$MGB_MPI.$PROCESS" )

for((CONT1=1;CONT1<$NUM_RPT;CONT1++))
        do
                for((AUX1=0;AUX1<${#arrayexec1[@]};AUX1++))
                do
			LOG1=(`echo ${arrayexec1[$AUX1]}| awk -F/ '{print $9}'`)
                        echo Benchmark: $LOG1
                        echo Contador: $CONT1
			echo "-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-" >> /mnt/nfs/home/wcp/logs/$LOG1.log
			echo Start in `date +%H:%M:%S--%d/%m/%Y` 2>&1>> /mnt/nfs/home/wcp/logs/$LOG1.log
			mpirun -np $PROCESS -machinefile /etc/nodefile ${arrayexec1[$AUX1]} >> /mnt/nfs/home/wcp/logs/$LOG1.log
                        echo Finish in `date +%H:%M:%S--%d/%m/%Y` 2>&1>> /mnt/nfs/home/wcp/logs/$LOG1.log
			echo "-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-" >> /mnt/nfs/home/wcp/logs/$LOG1.log
			sleep 1;
                done
        done
}

exec2()
{

PROCESS="2"
#arrayexec2=( "$EPB_MPI.$PROCESS" "$FTB_MPI.$PROCESS" "$ISB_MPI.$PROCESS" "$MGB_MPI.$PROCESS" )
arrayexec2=( "$CGB_MPI.$PROCESS" "$EPB_MPI.$PROCESS" "$FTB_MPI.$PROCESS" "$ISB_MPI.$PROCESS" "$LUB_MPI.$PROCESS" "$MGB_MPI.$PROCESS" )

for((CONT2=1;CONT2<$NUM_RPT;CONT2++))
        do
                for((AUX2=0;AUX2<${#arrayexec2[@]};AUX2++))
                do
			LOG2=(`echo ${arrayexec2[$AUX2]}| awk -F/ '{print $9}'`)
                        echo Benchmark: $LOG2
                        echo Contador: $CONT2
                        echo "-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-" >> /mnt/nfs/home/wcp/logs/$LOG2.log
			echo Start in `date +%H:%M:%S--%d/%m/%Y` 2>&1>> /mnt/nfs/home/wcp/logs/$LOG2.log
			mpirun -np $PROCESS -machinefile /etc/nodefile ${arrayexec2[$AUX2]} >> /mnt/nfs/home/wcp/logs/$LOG2.log
                        echo Finish in `date +%H:%M:%S--%d/%m/%Y` 2>&1>> /mnt/nfs/home/wcp/logs/$LOG2.log
                        echo "-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-" >> /mnt/nfs/home/wcp/logs/$LOG2.log
			sleep 1;
                done
        done
}

exec4()
{

PROCESS="4"
#arrayexec4=( "$EPB_MPI.$PROCESS" "$FTB_MPI.$PROCESS" "$ISB_MPI.$PROCESS" "$MGB_MPI.$PROCESS" )
arrayexec4=( "$SPB_MPI.$PROCESS" "$BTB_MPI.$PROCESS" "$CGB_MPI.$PROCESS" "$EPB_MPI.$PROCESS" "$FTB_MPI.$PROCESS" "$ISB_MPI.$PROCESS" "$LUB_MPI.$PROCESS" "$MGB_MPI.$PROCESS" )

for((CONT4=1;CONT4<$NUM_RPT;CONT4++))
        do
                for((AUX4=0;AUX4<${#arrayexec4[@]};AUX4++))
                do
			LOG4=(`echo ${arrayexec4[$AUX4]}| awk -F/ '{print $9}'`)
                        echo Benchmark: $LOG4
                        echo Contador: $CONT4
			echo "-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-" >> /mnt/nfs/home/wcp/logs/$LOG4.log
                        echo Start in `date +%H:%M:%S--%d/%m/%Y` 2>&1>> /mnt/nfs/home/wcp/logs/$LOG4.log
                        mpirun -np $PROCESS -machinefile /etc/nodefile ${arrayexec4[$AUX4]}  >> /mnt/nfs/home/wcp/logs/$LOG4.log
                        echo Finish in `date +%H:%M:%S--%d/%m/%Y` 2>&1>> /mnt/nfs/home/wcp/logs/$LOG4.log
                        echo "-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-" >> /mnt/nfs/home/wcp/logs/$LOG4.log
			sleep 1;
                done
        done
}

exec8()
{

PROCESS="8"
#arrayexec8=( "$EPB_MPI.$PROCESS" "$FTB_MPI.$PROCESS" "$ISB_MPI.$PROCESS" "$MGB_MPI.$PROCESS" )
arrayexec8=( "$CGB_MPI.$PROCESS" "$EPB_MPI.$PROCESS" "$FTB_MPI.$PROCESS" "$ISB_MPI.$PROCESS" "$LUB_MPI.$PROCESS" "$MGB_MPI.$PROCESS" )

for((CONT8=1;CONT8<$NUM_RPT;CONT8++))
        do
                for((AUX8=0;AUX8<${#arrayexec8[@]};AUX8++))
                do
			LOG8=(`echo ${arrayexec8[$AUX8]}| awk -F/ '{print $9}'`)
			echo "-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-" >> /mnt/nfs/home/wcp/logs/$LOG8.log
                        echo Start in `date +%H:%M:%S--%d/%m/%Y` 2>&1>> /mnt/nfs/home/wcp/logs/$LOG8.log
                        echo Benchmark: $LOG8
                        echo Contador: $CONT8
                        mpirun -np $PROCESS -machinefile /etc/nodefile ${arrayexec8[$AUX8]}  >> /mnt/nfs/home/wcp/logs/$LOG8.log
                        echo Finish in `date +%H:%M:%S--%d/%m/%Y` 2>&1>> /mnt/nfs/home/wcp/logs/$LOG8.log
                        echo "-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-" >> /mnt/nfs/home/wcp/logs/$LOG8.log
			sleep 1;
                done
        done
}

exec9()
{
PROCESS="9"
arrayexec9=( "$SPB_MPI.$PROCESS" "$BTB_MPI.$PROCESS" "$EPB_MPI.$PROCESS" )
for((CONT9=1;CONT9<$NUM_RPT;CONT9++))
        do
                for((AUX9=0;AUX9<${#arrayexec9[@]};AUX9++))
                do
			LOG9=(`echo ${arrayexec9[$AUX9]}| awk -F/ '{print $9}'`)
                        echo "-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-" >> /mnt/nfs/home/wcp/logs/$LOG9.log
                        echo Start in `date +%H:%M:%S--%d/%m/%Y` 2>&1>> /mnt/nfs/home/wcp/logs/$LOG9.log
			echo Benchmark: $LOG9
                        echo Contador: $CONT9
			mpirun -np $PROCESS -machinefile /etc/nodefile ${arrayexec9[$AUX9]} >> /mnt/nfs/home/wcp/logs/$LOG9.log
			echo Finish in `date +%H:%M:%S--%d/%m/%Y` 2>&1>> /mnt/nfs/home/wcp/logs/$LOG9.log
                        echo "-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-" >> /mnt/nfs/home/wcp/logs/$LOG9.log
                        sleep 1;
                done
        done
}

exec16()
{
PROCESS="16"
#arrayexec16=( "$EPB_MPI.$PROCESS" "$FTB_MPI.$PROCESS" "$ISB_MPI.$PROCESS" "$MGB_MPI.$PROCESS" )
arrayexec16=( "$BTB_MPI.$PROCESS" "$CGB_MPI.$PROCESS" "$FTB_MPI.$PROCESS" "$ISB_MPI.$PROCESS" "$LUB_MPI.$PROCESS" "$MGB_MPI.$PROCESS" "$SPB_MPI.$PROCESS" "$EPB_MPI.$PROCESS" )

for((CONT16=1;CONT16<$NUM_RPT;CONT16++))
        do
                for((AUX16=0;AUX16<${#arrayexec16[@]};AUX16++))
                do
			LOG16=(`echo ${arrayexec16[$AUX16]}| awk -F/ '{print $9}'`)
                        echo "-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-" >> /mnt/nfs/home/wcp/logs/$LOG16.log
			echo Start in `date +%H:%M:%S--%d/%m/%Y` 2>&1>> /mnt/nfs/home/wcp/logs/$LOG16.log
			echo Benchmark: $LOG16
                        echo Contador: $CONT16
                        mpirun -np $PROCESS -machinefile /etc/nodefile ${arrayexec16[$AUX16]}  >> /mnt/nfs/home/wcp/logs/$LOG16.log
			echo Finish in `date +%H:%M:%S--%d/%m/%Y` 2>&1>> /mnt/nfs/home/wcp/logs/$LOG16.log
                        echo "-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-" >> /mnt/nfs/home/wcp/logs/$LOG16.log
                        sleep 1;
                done
        done

}

exec18()
{
PROCESS="18"
arrayexec18=( "$EPB_MPI.$PROCESS" )

for((CONT18=1;CONT18<2;CONT18++))
        do
                for((AUX18=0;AUX18<${#arrayexec18[@]};AUX18++))
                do
                        LOG18=(`echo ${arrayexec18[$AUX18]}| awk -F/ '{print $9}'`)
                        echo "-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-" >> /mnt/nfs/home/wcp/logs/$LOG18.log
                        echo Start in `date +%H:%M:%S--%d/%m/%Y` 2>&1>> /mnt/nfs/home/wcp/logs/$LOG18.log
                        echo Bencmark: $LOG18
                        echo Contador: $CONT18
			mpirun -np 16 -machinefile /etc/nodefile $MGB_MPI.16 > /dev/null
		        mpirun -np $PROCESS -machinefile /etc/nodefile ${arrayexec18[$AUX18]}  >> /mnt/nfs/home/wcp/logs/$LOG18.log
                        echo Finish in `date +%H:%M:%S--%d/%m/%Y` 2>&1>> /mnt/nfs/home/wcp/logs/$LOG18.log
                        echo "-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-" >> /mnt/nfs/home/wcp/logs/$LOG18.log
                        sleep 1;
                done
        done

}

exec20()
{
PROCESS="20"
arrayexec20=( "$EPB_MPI.$PROCESS" )

for((CONT20=1;CONT20<2;CONT20++))
        do
                for((AUX20=0;AUX20<${#arrayexec20[@]};AUX20++))
                do
                        LOG20=(`echo ${arrayexec20[$AUX20]}| awk -F/ '{print $9}'`)
                        echo "-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-" >> /mnt/nfs/home/wcp/logs/$LOG20.log
                        echo Start in `date +%H:%M:%S--%d/%m/%Y` 2>&1>> /mnt/nfs/home/wcp/logs/$LOG20.log
                        echo Bencmark: $LOG20
                        echo Contador: $CONT20
                        mpirun -np 16 -machinefile /etc/nodefile $MGB_MPI.16 > /dev/null
                        mpirun -np $PROCESS -machinefile /etc/nodefile ${arrayexec20[$AUX20]}  >> /mnt/nfs/home/wcp/logs/$LOG20.log
                        echo Finish in `date +%H:%M:%S--%d/%m/%Y` 2>&1>> /mnt/nfs/home/wcp/logs/$LOG20.log
                        echo "-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-" >> /mnt/nfs/home/wcp/logs/$LOG20.log
                        sleep 1;
                done
        done

}

exec24()
{
PROCESS="24"
arrayexec24=( "$EPB_MPI.$PROCESS" )

for((CONT24=1;CONT24<2;CONT24++))
        do
                for((AUX24=0;AUX24<${#arrayexec24[@]};AUX24++))
                do
                        LOG24=(`echo ${arrayexec24[$AUX24]}| awk -F/ '{print $9}'`)
                        echo "-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-" >> /mnt/nfs/home/wcp/logs/$LOG24.log
                        echo Start in `date +%H:%M:%S--%d/%m/%Y` 2>&1>> /mnt/nfs/home/wcp/logs/$LOG24.log
                        echo Bencmark: $LOG24
                        echo Contador: $CONT24
                        mpirun -np 16 -machinefile /etc/nodefile $MGB_MPI.16 > /dev/null
                        mpirun -np $PROCESS -machinefile /etc/nodefile ${arrayexec24[$AUX24]}  >> /mnt/nfs/home/wcp/logs/$LOG24.log
                        echo Finish in `date +%H:%M:%S--%d/%m/%Y` 2>&1>> /mnt/nfs/home/wcp/logs/$LOG24.log
                        echo "-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-" >> /mnt/nfs/home/wcp/logs/$LOG24.log
                        sleep 1;
                done
        done

}

#---------------------------------------------------------------
#Fim das definições das funções
#---------------------------------------------------------------

#---------------------------------------------------------------
#Inicio do código da execução
#
#O primeiro FOR chama cada função  definida dentro do array.
#---------------------------------------------------------------

for((i=0;i<${#array[@]};i++))
do
	${array[$i]}
	echo "============================================"
	echo "#############################################"
	echo "#						  "
	echo "#		   END ${array[$i]}               "
	echo "#						  "
	echo "#############################################"
	echo "============================================"
sleep 1;
done
