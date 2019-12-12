#!/bin/bash

function topology(){
	# $1 - ip (ip do controlador)
	# $2 - port (porta do controlador)
	# $3 - nameController (nome do controlador)
	# $4 - nodesQuantity  (quantidade de nós utilizaados)
	# $5 - flag  (run para continuar a execução ou stop para parar)
	# $6 path
	# $7 repeat_number - número da repetição

	/usr/bin/time -f "Tempo decorrido: %E\nPercentual da CPU: %P\nTempo real decorrido relacionado ao processo: %e" \
	sudo python /home/randel/mininet-wifi/examples/cenariosIoT.py $1 $2 $3 $4 $5 $7 2>>  errorCenariosIoT$3_$4.txt >> log_teste 2>> ~/TCC/Experimento/resultados_experimento/$6/time_execucao_$3_$4.txt
}

