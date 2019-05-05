#!/bin/bash

source ./mininet_wifi.sh
# Primeiro fator é o controlador sdn, os níveis são NOX, Opendaylight, Ryu, Floodlight, POX, Maestro, Trema e Beacon.

#controllerSDN=(NOX Opendaylight Ryu Floodlight POX Maestro Trema Beacon) 

controllerSDN=(Ryu Floodlight POX) 

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
			echo "Entrando no controlador: " $controller;
			echo
			cd /home/floodlight;
			echo "Inicializando o controlador: " $controller;
			touch log_experimento_execucao$controller.txt			
			java -jar target/floodlight.jar >> log_experimento_execucao$controller.txt &

			sleep 10
		
			echo "Estartando o mininet wifi e criando uma topologia simples...."			
			topology 127.0.0.1 6653 &		

			while [ $(ps -ef | grep "jar target/floodlight.jar" | wc -l) -eq 2 ];
			do
				# echo  $(ps -ef | grep "target/floodlight.jar" | wc -l)			
				echo "Experimento do controlador $controller ainda está sendo realizado..."
				sleep 2
			done
		
			echo "Experimento do controlador $controller finalizado!"
			
    	;;      

		"POX")
			#echo "sim " $controller;
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
