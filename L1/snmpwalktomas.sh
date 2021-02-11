#!/bin/bash
#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

echo -e "${turquoiseColour}SNMPWALK v.100 by Tomás Jesús García López${endColour}"

if [ "$#" -ne "1" ];then
	echo -e "${redColour}Error, uso: ./snmpwalktomas.sh <number o name>${endColour}"
fi
#Vamos a comprobar si es una tabla, para si no lo es solo recorrer recursivamente ese miembro o recorrerlo una sola vez
snmptable -v1 -c gar tales $1 &>/tmp/snmptablelog
if [ "$(echo $?)" == "1" ];then
	#Aqui haremos la lógica cuando no sea una tabla
	snmpinicial=$(snmpgetnext -v1 -c gar tales $1)
	outputinicial=${snmpinicial//*::/ }
	outputinicial=${outputinicial//.*/ }
	outputinicial=${outputinicial// /} #quitamos espacios en blanco
	outputrfc=$outputinicial
	siguiente=$1
	while [ "$(echo $outputinicial)" == "$(echo $outputrfc)" ];do
		result=$(snmpgetnext -v1 -c gar tales $siguiente)
		siguiente=$(echo $result | awk '{print $1}')
		outputrfc=${siguiente//*::/ }
		outputrfc=${outputrfc//.*/ }
		outputrfc=${outputrfc// /}
		if [ "$(echo $outputinicial)" == "$(echo $outputrfc)" ];then
			echo -e "${greenColour}$result${endColour}"
		fi
	done
else
	snmpinicial=$(snmpgetnext -v1 -c gar tales $1)
	outputinicial=${snmpinicial//::*/ }
	outputinicial=${outputinicial// /} #quitamos espacios en blanco
	outputrfc=$outputinicial
	siguiente=$1

	while [ "$(echo $outputinicial)" == "$(echo $outputrfc)" ]; do
		result=$(snmpgetnext -v1 -c gar tales $siguiente)
		siguiente=$(echo $result | awk '{print $1}')
		outputrfc=${siguiente//::*/ }
		outputrfc=${outputrfc// /}
		if [ "$(echo $outputinicial)" == "$(echo $outputrfc)" ];then
			echo -e "${greenColour}$result${endColour}"
		fi
	done
fi
rm /tmp/snmptablelog 2>/dev/null
