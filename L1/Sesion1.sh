#!/bin/bash
# COmo alternativa al online mib bat /usr/share/snmp/mibs/UCD-SNMP-MIB.txt
# Ejercicio 1
snmpget -v1 -c gar tales 1.3.6.1.2.1.1.1.0

# Ejercicio 2
#Primero sacaremos el ifNumber de tales, luego filtraremos ese numero en la tabla de direcciones fisicas
snmpget -v1 -c gar tales ifTable.1.6.$(snmpget -v1 -c gar tales 1.3.6.1.2.1.2.1.0 | awk '{print $4}')
