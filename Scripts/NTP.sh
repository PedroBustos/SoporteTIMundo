#!bin/bash

#Servidor de hora NTP

#Instalar el servicio NTP
sudo apt install ntp -y
sudo apt install ntpdate -y
#Sincronizar el equipo con el servidor NTP de MP

ntpdate -u  ntp.pacificored.cl 

#Agregar servidor al sistema para consultar la hora

sed -i "21,24s/\(Pool\)/# \1 /" /etc/ntp.conf 

sed -i "17a server ntp.pacificored.cl" /etc/ntp.conf

