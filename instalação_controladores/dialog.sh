#!/bin/bash

function exitAplication(){
sleep 3
clear
exit 1
}

function msgBoxAndBacktitle(){
dialog --backtitle "$1" 	       --msgbox "$2" 0 0
}

function returnParamsChecklist(){
echo "$1" | while read LINHA
do
echo "$LINHA"
done
}

function checklist(){
# Deixa
gostos=$(dialog --stdout 		              --separate-output                      		              --backtitle 'Aperte space para selecionar ou retirar a seleção de uma caixa'		              --checklist 'Do que você gosta?' 0 0 0 	                'jogar futebol'      '' off 	                'pescar'             '' off 	                'ir ao shopping'     '' off 	                'andar de bicicleta' '' off 	                'ficar na internet'  '' off 	                'dormir'             '' off )
}


clear
returnParamsChecklist "$gostos"
