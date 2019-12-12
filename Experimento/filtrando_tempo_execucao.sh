#!/bin/bash

path="resultados_experimento";
controllerSDN=( Ryu Floodlight POX );
nodesQuantity=( 26 52 104 );

for controller in "${controllerSDN[@]}"
do
    for quantity in "${nodesQuantity[@]}"
    do
	arquivo=$path/$controller"_Nos_"$quantity/"time_execucao_"$controller"_"$quantity".txt";
	cat $arquivo | grep "Tempo real" | cut -d" " -f7 > $path/$controller"_Nos_"$quantity/"time_execucao_real_"$controller"_"$quantity".txt";
        cat $arquivo | grep Percentual | cut -d" " -f4 | cut -d"%" -f1 > $path/$controller"_Nos_"$quantity/"time_execucao_Percentual_CPU_"$controller"_"$quantity".txt";
    done
done
