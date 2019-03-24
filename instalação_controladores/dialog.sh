#!/bin/bash

function exitAplication(){
sleep 3
clear
exit 1
}

function msgBoxAndBacktitle(){
dialog --backtitle "$1" 	       --msgbox "$2" 0 0
}

