#!/bin/bash

path="resultados_experimento";
controllerSDN=( Ryu Floodlight POX );
nodesQuantity=( 104 );
#nodesQuantity=( 26 52 104 );

for controller in "${controllerSDN[@]}"
do
    for quantity in "${nodesQuantity[@]}"
    do
	arquivo=$path/$controller"_Nos_"$quantity/"processor_consumption_"$controller$quantity".txt";

	cat $arquivo | grep Mem: | cut -d":" -f2 |  tr -s [:space:] | cut -d" " -f3 > $path/$controller"_Nos_"$quantity/"processor_consumption_used_"$controller$quantity".txt";
	cat $arquivo | grep Mem: | cut -d":" -f2 |  tr -s [:space:] | cut -d" " -f4 > $path/$controller"_Nos_"$quantity/"processor_consumption_free_"$controller$quantity".txt";
	cat $arquivo | grep Mem: | cut -d":" -f2 |  tr -s [:space:] | cut -d" " -f7 > $path/$controller"_Nos_"$quantity/"processor_consumption_available_"$controller$quantity".txt";
    done
done
