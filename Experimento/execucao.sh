#!/bin/bash

source ./mininet_wifi.sh
# Primeiro fator é o controlador sdn, os níveis são NOX, Opendaylight, Ryu, Floodlight, POX, Maestro, Trema e Beacon.
# O Segundo fator é o número de nós IoT
#controllerSDN=(NOX Opendaylight Ryu Floodlight POX Maestro Trema Beacon)

controllerSDN=( POX ) # Ryu Floodlight
nodesQuantity=(2 5 10)

for controller in "${controllerSDN[@]}"
do
	case $controller in
		"NOX")
			echo "sim " $controller;
    	;;

		"Opendaylight")
			echo "sim " $controller;
    	;;

		"Ryu")
			#echo "sim " $controller;
    	;;

		"Floodlight")
			for quantity in "${nodesQuantity[@]}"
			do
				echo "Entrando no controlador: $controller, Número de nós: $quantity";
				echo
				cd /home/floodlight;
				echo "Inicializando o controlador: " $controller;
				touch log_experimento_execucao$controller.txt
				java -jar target/floodlight.jar >> log_experimento_execucao$controller.txt &

				sleep 10

				echo "Estartando o mininet wifi e criando uma topologia simples...."
				topology 127.0.0.1 6653 Floodlight $quantity &

				#echo "Número de processos: " $(expr $(ps -ef | grep "jar target/floodlight.jar" | wc -l) - 1)

				while [ $(ps -ef | grep "jar target/floodlight.jar" | wc -l) -eq 2 ];
				do
					echo "Número de processos: " $(expr $(ps -ef | grep "jar target/floodlight.jar" | wc -l) - 1)
					#echo  $(ps -ef | grep "target/floodlight.jar" | wc -l)
					echo "Experimento do controlador $controller com $quantity nós executando"
					sleep 2
				done
				clear
				echo "Experimento do controlador $controller com $quantity nós finalizado!"
			done

    	;;

		"POX")
			#echo "sim " $controller;
			for quantity in "${nodesQuantity[@]}"
			do
				echo "Entrando no controlador: $controller, Número de nós: $quantity";
				echo
				cd /home/pox;
				echo "Inicializando o controlador: " $controller;
				touch log_experimento_execucao$controller.txt
				sudo ./pox.py pox.forwarding.hub openflow.of_01 --port=6635 >> log_experimento_execucao$controller.txt &

				sleep 10

				echo "Estartando o mininet wifi e criando uma topologia simples...."
				topology 127.0.0.1 6635 POX $quantity &

				#echo "Número de processos: " $(expr $(ps -ef | grep "jar target/floodlight.jar" | wc -l) - 1)

				while [ $(ps -ef | grep "pox.py pox.forwarding.hub openflow.of_01" | wc -l) -eq 2 ];
				do
					echo "Número de processos: " $(expr $(ps -ef | grep "pox.py pox.forwarding.hub openflow.of_01" | wc -l) - 1)
					#echo  $(ps -ef | grep "target/floodlight.jar" | wc -l)
					echo "Experimento do controlador $controller com $quantity nós executando"
					sleep 2
				done
				clear
				echo "Experimento do controlador $controller com $quantity nós finalizado!"
			done
    	;;

		"Maestro")
			echo "sim " $controller;
    	;;

		"Trema")
			echo "sim " $controller;
    	;;

		"Beacon")
			echo "sim " $controller;
    	;;
    esac
done

clear
echo "Todos os experimentos foram finalizados!!!"
