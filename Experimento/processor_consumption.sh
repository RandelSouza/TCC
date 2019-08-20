#!/bin/bash

# $1 Nome do controlador SDN.
# $2 Número de nós.
# $3 path
while true;
do
    sleep 1;
    free -m >> ~/TCC/Experimento/resultados_experimento/$3/processor_consumption_$1$2.txt;
done
