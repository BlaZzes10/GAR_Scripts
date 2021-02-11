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

identero=$(snmpwalk -v1 -c gar tales ifTable | grep "\<eth0\>" | awk '{print $1}')
len=$(( ${#identero} - 1 ))
id=${identero:$len}
dirfisica=$(snmpget -v1 -c gar tales 1.3.6.1.2.1.2.2.1.6.$id | awk '{print $4}')
dirlogica=$(snmpwalk -v1 -c gar tales ipAdEntAddr | grep 161 | awk '{print $4}')
echo -e "${redColour}|------------------|-------------------|${endColour}"
echo -e "${redColour}|${endColour} ${purpleColour}Direccion Física${endColour} ${redColour}|${endColour} ${purpleColour}Direccion Lógica ${endColour} ${redColour}|${endColour}"
echo -e "${redColour}|--------------------------------------|${endColour}"
echo -e "${redColour}|${endColour} ${purpleColour}$dirfisica${endColour} ${redColour}|${endColour} ${purpleColour}${endColour}${purpleColour}  $dirlogica   ${endColour}${redColour}|${endColour}"
echo -e "${redColour}|--------------------------------------|${endColour}"
