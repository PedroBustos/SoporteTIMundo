#!bin/bash

#Instalacion de WPS
echo "**"COMENZANDO DESCARGA DE WPS"**"
echo Indique su usuario
read usuario

smbget -U $usuario smb://sr000116/Soporte_TI/Kubuntu/WPS/wps-office_11.1.0.8865_amd64.deb

dpkg -i wps-office_11.1.0.8865_amd64.deb


echo "**"DESCARGANDO FIX WPS"**"

smbget -U $usuario smb://sr000116/Soporte_TI/Kubuntu/WPS/wps-full-fix-es_1.0-2019_all.deb

dpkg -i wps-full-fix-es_1.0-2019_all.deb

echo "**"WPS INSTALADO"**"
