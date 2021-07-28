#!bin/bash

#Para descargar el nuevo paquete de LibreOffice 7.0, vamos a ejecutar el siguiente comando:


wget http://download.documentfoundation.org/libreoffice/stable/7.1.5/deb/x86_64/LibreOffice_7.1.5_Linux_x86-64_deb.tar.gz

#Hecha la descarga ahora podemos extraer el contenido del archivo descargado con:


tar xvfz LibreOffice_7.1.5_Linux_x86-64_deb.tar.gz

#Entramos al directorio creado:

cd LibreOffice_7.1.5.2_Linux_x86-64_deb/DEBS/

#Y finalmente instalamos los paquetes que están dentro de este directorio con el siguiente comando:

sudo dpkg -i *.deb

#Ahora procedemos a descargar el paquete de traducción al español con:


cd ..
cd ..
wget http://download.documentfoundation.org/libreoffice/stable/7.1.5/deb/x86_64/LibreOffice_7.1.5_Linux_x86-64_deb_langpack_es.tar.gz

#Y procedemos a descomprimir ya instalar los paquetes resultantes:

tar xvfz LibreOffice_7.1.5_Linux_x86-64_deb_langpack_es.tar.gz
cd LibreOffice_7.1.5.2_Linux_x86-64_deb_langpack_es/DEBS/
sudo dpkg -i *.deb

#Finalmente, en caso de tener algún problema con las dependencias, podemos ejecutar el siguiente comando:

sudo apt-get -f install
