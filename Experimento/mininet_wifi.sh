#!/bin/bash

function topology(){
	# $1 - ip
	# $2 - port	
	cd /home/mininet-wifi/examples
	sudo python iot4.py $1 $2
	
}

