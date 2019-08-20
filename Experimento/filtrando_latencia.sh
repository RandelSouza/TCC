#!/bin/bash

path="resultados_experimento";
controllerSDN=( Ryu Floodlight POX );
nodesQuantity=( 2 5 10 );

for controller in "${controllerSDN[@]}"
do
    for quantity in "${nodesQuantity[@]}"
    do
	arquivo=$path/$controller"_Nos_"$quantity/"latencia_"$controller"_Numero_de_Nos_"$quantity".txt";	
	cat $arquivo | grep rtt | cut -d" " -f4 | cut -d"/" -f1 > $path/$controller"_Nos_"$quantity/"latencia_min_"$controller"_Nos_"$quantity.txt;
	cat $arquivo | grep rtt | cut -d" " -f4 | cut -d"/" -f2 > $path/$controller"_Nos_"$quantity/"latencia_avg_"$controller"_Nos_"$quantity.txt;
	cat $arquivo | grep rtt | cut -d" " -f4 | cut -d"/" -f3 > $path/$controller"_Nos_"$quantity/"latencia_max_"$controller"_Nos_"$quantity.txt;
    done
done
