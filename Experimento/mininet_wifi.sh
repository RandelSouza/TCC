#!/bin/bash

function topology(){
	# $1 - ip
	# $2 - port
	# $3 - nameController
	# $4 - nodesQuantity
	cd /home/mininet-wifi/examples
	sudo python iot.py 2>>  errorMn.txt
	sudo python iot.py 2>>  errorMn.txt
	sudo python iot4.py $1 $2 $3 $4 2>>  errorIoT4$3$4.txt > /dev/null
}
