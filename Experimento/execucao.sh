#!/bin/bash

source ./mininet_wifi.sh

# Primeiro fator é o controlador SDN, os níveis são NOX, Opendaylight, Ryu, Floodlight, POX, Maestro, Trema e Beacon.
# Primeiro fator é o controlador sdn, os níveis são NOX, Opendaylight, Ryu, Floodlight, POX, Maestro, Trema e Beacon.
# O Segundo fator é o número de nós IoT
# NOX e Trema não serão utilizados, pois não é possivel a integração com o mininet_wifi.
# Na literatura o controlador NOX já está obsoleto e é incentivado que use-se o POX ao invés dele.
# Na literatura o controlador NOX já está obsoleto e é incentivado que se use o POX ao invés dele.
# Já o controlador Trema de acordo com alguns autores somente é usado para modo de pesquisa e não possui integração com o mininet_wifi.
#controllerSDN=(NOX Opendaylight Ryu Floodlight POX Maestro Trema Beacon)

controllerSDN=( Ryu Floodlight POX )
# A capacidade do canal é de 1 Mbps por padrão

#controllerSDN=( Ryu );
#controllerSDN=( Floodlight );
#controllerSDN=( POX );

nodesQuantity=( 2 5 10 );
stopValueNodesQuantity=10;
repeat=500
mkdir ~/TCC/Experimento/resultados_experimento > /dev/null 2> /dev/null;

controllerSDN=( Floodlight POX Ryu )
# A  capacidade do canal é de 1 Mbps por padrão

#controllerSDN=( Ryu )
nodesQuantity=( 2 5 10 )
packetLoss=( 5  10 )
linkDelay=( "10ms" "100ms" )

stopValueNodesQuantity=10
stopValuePacketLoss=10
stopValuelinkDelay="100ms"

mkdir ~/resultados_experimento > /dev/null 2> /dev/null

for controller in "${controllerSDN[@]}"
do
	case $controller in
		"Ryu")

			cd /home/randel/ryu;
			echo "Inicializando o controlador: " $controller;
			touch log_experimento_execucao$controller.txt 2> /dev/null > /dev/null;
			sudo PYTHONPATH=. ./bin/ryu run --observe-links ryu/app/gui_topology/gui_topology.py --ofp-tcp-listen-port=6636 2>> log_experimento_execucao$controller.txt > /dev/null &

			sleep 10;

			for quantity in "${nodesQuantity[@]}"
			do
				mkdir -p ~/TCC/Experimento/resultados_experimento/Ryu_Nos_$quantity > /dev/null 2> /dev/null;

				# Começa a coletar os dados de consumo de processador.
				sudo ~/TCC/Experimento/./processor_consumption.sh $controller $quantity Ryu_Nos_$quantity &

				for i in `seq $repeat`
				do
					flag="run";
					echo "Entrando no controlador: $controller, Número de nós: $quantity";
					echo;
					echo "Rodando o mininet wifi e criando o cenário.";
					echo "Experimento do controlador $controller com $quantity nós. Número $i.";

					if [ $quantity -eq $stopValueNodesQuantity ]
					then
						flag="stop";
					fi

					topology 127.0.0.1 6636 Ryu $quantity $flag Ryu_Nos_$quantity

					echo "Experimento do controlador $controller com $quantity nós, finalizado!";
				done

				# Finalizando a coleta de dados de consumo de processador.
				sudo ~/TCC/Experimento/./kill_processor_consumption.sh;
				
			cd /home/randel/ryu;
			echo "Inicializando o controlador: " $controller;
			touch log_experimento_execucao$controller.txt 2> /dev/null > /dev/null
			sudo PYTHONPATH=. ./bin/ryu run --observe-links ryu/app/gui_topology/gui_topology.py --ofp-tcp-listen-port=6636 2>> log_experimento_execucao$controller.txt > /dev/null &

			sleep 10

			for quantity in "${nodesQuantity[@]}"
			do
				mkdir -p ~/resultados_experimento/Ryu_Nos_$quantity > /dev/null 2> /dev/null

				for loss in "${packetLoss[@]}"
				do
					for delay in "${linkDelay[@]}"
					do
						for i in `seq 2`
						do
							flag="run"
							echo "Entrando no controlador: $controller, Número de nós: $quantity, Perda de Pacotes: $loss, Delay: $delay";
							echo
							echo "Rodando o mininet wifi e criando o cenário."
							echo "Experimento do controlador $controller com $quantity nós, com perda de pacotes de $loss% e delay de $delay ms. Número $i."			

							if [ $quantity -eq $stopValueNodesQuantity ] && [ $loss -eq $stopValuePacketLoss ] && [ $delay == $stopValuelinkDelay ]
							then
								flag="stop"
							fi

							topology 127.0.0.1 6636 Ryu $quantity $flag $loss $delay

							echo "Experimento do controlador $controller com $quantity nós, Perda de Pacotes $loss e Delay $delay finalizado!"
						done
					done
				done
			done


    	;;

		"Floodlight")

			cd /home/randel/floodlight;
			echo "Inicializando o controlador: " $controller;
			touch log_experimento_execucao$controller.txt 2> /dev/null > /dev/null;
			java -jar target/floodlight.jar 2>> log_experimento_execucao$controller.txt > /dev/null &

			sleep 10;

			for quantity in "${nodesQuantity[@]}"
			do
				mkdir -p ~/TCC/Experimento/resultados_experimento/Floodlight_Nos_$quantity > /dev/null 2> /dev/null;

				# Começa a coletar os dados de consumo de processador.
				sudo ~/TCC/Experimento/./processor_consumption.sh $controller $quantity Floodlight_Nos_$quantity &

				for i in `seq $repeat`
				do
					flag="run";
					echo "Entrando no controlador: $controller, Número de nós: $quantity";
					echo;
					echo "Rodando o mininet wifi e criando o cenário.";
					echo "Experimento do controlador $controller com $quantity nós. Número $i.";

					if [ $quantity -eq $stopValueNodesQuantity ]
					then
						flag="stop";
					fi

					topology 127.0.0.1 6653 Floodlight $quantity $flag Floodlight_Nos_$quantity

					echo "Experimento do controlador $controller com $quantity nós, finalizado!";
				done

				# Finalizando a coleta de dados de consumo de processador.
				sudo ~/TCC/Experimento/./kill_processor_consumption.sh;
				
			cd /home/randel/floodlight;
			echo "Inicializando o controlador: " $controller;
			touch log_experimento_execucao$controller.txt 2> /dev/null > /dev/null
			java -jar target/floodlight.jar 2>> log_experimento_execucao$controller.txt > /dev/null &

			sleep 10

			for quantity in "${nodesQuantity[@]}"
			do
				mkdir -p ~/resultados_experimento/Floodlight_Nos_$quantity > /dev/null 2> /dev/null

				for loss in "${packetLoss[@]}"
				do
					for delay in "${linkDelay[@]}"
					do
						for i in `seq 30`
						do
							flag="run"
							echo "Entrando no controlador: $controller, Número de nós: $quantity, Perda de Pacotes: $loss, Delay: $delay";
							echo
							echo "Rodando o mininet wifi e criando o cenário."
							echo "Experimento do controlador $controller com $quantity nós, com perda de pacotes de $loss% e delay de $delay ms. Número $i."				

							if [ $quantity -eq $stopValueNodesQuantity ] && [ $loss -eq $stopValuePacketLoss ] && [ $delay == $stopValuelinkDelay ]
							then
								flag="stop"
							fi

							topology 127.0.0.1 6653 Floodlight $quantity $flag $loss $delay

							echo "Experimento do controlador $controller com $quantity nós, Perda de Pacotes $loss e Delay $delay finalizado!"
						done
					done
				done
			done

    	;;

		"POX")

			cd /home/randel/pox;
			echo "Inicializando o controlador: " $controller;
			touch log_experimento_execucao$controller.txt 2> /dev/null > /dev/null;
			sudo ./pox.py pox.forwarding.hub openflow.of_01 --port=6635 2>> log_experimento_execucao$controller.txt > /dev/null &

			sleep 10;

			for quantity in "${nodesQuantity[@]}"
			do
				mkdir -p ~/TCC/Experimento/resultados_experimento/POX_Nos_$quantity;

				# Começa a coletar os dados de consumo de processador.
				sudo ~/TCC/Experimento/./processor_consumption.sh $controller $quantity POX_Nos_$quantity &

				for i in `seq $repeat`
				do
					flag="run";
					echo "Entrando no controlador: $controller, Número de nós: $quantity";
					echo;
					echo "Rodando o mininet wifi e criando o cenário.";
					echo "Experimento do controlador $controller com $quantity nós. Número $i.";

					if [ $quantity -eq $stopValueNodesQuantity ]
					then
						flag="stop";
					fi

					topology 127.0.0.1 6635 POX $quantity $flag POX_Nos_$quantity
					echo "Experimento do controlador $controller com $quantity nós, finalizado!";
				done

				# Finalizando a coleta de dados de consumo de processador.
				sudo ~/TCC/Experimento/./kill_processor_consumption.sh;
				
			cd /home/randel/pox;
			echo "Inicializando o controlador: " $controller;
			touch log_experimento_execucao$controller.txt 2> /dev/null > /dev/null
			sudo ./pox.py pox.forwarding.hub openflow.of_01 --port=6635 2>> log_experimento_execucao$controller.txt > /dev/null &

			sleep 10

			for quantity in "${nodesQuantity[@]}"
			do
				mkdir -p ~/resultados_experimento/POX_Nos_$quantity

				for loss in "${packetLoss[@]}"
				do
					for delay in "${linkDelay[@]}"
					do
						for i in `seq 30`
						do
							flag="run"
							echo "Entrando no controlador: $controller, Número de nós: $quantity, Perda de Pacotes: $loss, Delay: $delay";
							echo
							echo "Rodando o mininet wifi e criando o cenário."
							echo "Experimento do controlador $controller com $quantity nós, com perda de pacotes de $loss% e delay de $delay ms. Número $i."

							if [ $quantity -eq $stopValueNodesQuantity ] && [ $loss -eq $stopValuePacketLoss ] && [ $delay == $stopValuelinkDelay ]
							then
								flag="stop"
							fi

							topology 127.0.0.1 6635 POX $quantity $flag $loss $delay
							echo "Experimento do controlador $controller com $quantity nós, Perda de Pacotes $loss e Delay $delay finalizado!"
						done
					done
				done
			done
    	;;
    esac
done


echo "Todos os experimentos foram finalizados!!!"
