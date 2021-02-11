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

if [ "$#" -ne 1 ]
then
	echo "uso: ./ejercicio6.sh <host>"
	exit 1
fi
mascara=$(snmpget -v1 -c gar tales 1.3.6.1.2.1.4.20.1.3.$1 2>/tmp/errormask | awk '{print $4}')
texterror=$(cat /tmp/errormask)
# vemos si hay algún error
error=${texterror:0:15}
#echo "$error"
if [ "$(echo $error)" == "Error in packet" ];
then
	echo -e "${redColour}Ha ocurrido un error, revisa la dirección del host${endColour}"
else
	dirred=$(ipcalc "$1"/"$mascara" | grep Network | awk '{print $2}')
	echo -e "${redColour}Dirección de Red: ${endColour}${purpleColour}$dirred${endColour}"
fi

rm /tmp/errorpasarela 2>/dev/null
