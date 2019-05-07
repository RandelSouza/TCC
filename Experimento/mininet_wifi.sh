#!/bin/bash

function topology(){
	# $1 - ip
	# $2 - port
	# $3 - nameController
	# $4 - nodesQuantity
	cd /home/mininet-wifi/examples
	sudo python iot4.py $1 $2 $3 $4

}
