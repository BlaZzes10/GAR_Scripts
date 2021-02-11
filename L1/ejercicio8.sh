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

echo -e "${blueColour}Primero vemos los Id de procesos (host) que tenemos${endColour}"
echo -e "${purpleColour}------------------------------------------------------${endColour}"
echo -e "${redColour} $(snmpwalk -v 2c -c gar tales hrDeviceIndex)${endColour}"
echo -e "${purpleColour}------------------------------------------------------${endColour}"
echo -e "${blueColour}A continuación comparamos esos procesos con la CPU que usan${endColour}"
echo -e "${purpleColour}------------------------------------------------------${endColour}"
echo -e "${redColour}$(snmpwalk -v 2c -c gar tales hrProcessorLoad)${endColour}"
echo -e "${purpleColour}------------------------------------------------------${endColour}"

#NOTA: es posible que tambien sea el comando snmpwalk -v1 -c gar tales hrSWRunPerfCPU
