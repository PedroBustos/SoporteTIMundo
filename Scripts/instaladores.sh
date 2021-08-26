#!/bin/bash


#Servidor de hora NTP

#Instalar el servicio NTP
sudo apt update
sudo apt install ntp -y
sudo apt install ntpdate -y
#Sincronizar el equipo con el servidor NTP de MP

ntpdate -u  ntp.pacificored.cl 

#Agregar servidor al sistema para consultar la hora
sed -i "21,26s/pool/#/" /etc/ntp.conf 
sed -i "21,26s/Pool/#/" /etc/ntp.conf 

sed -i "17a server ntp.pacificored.cl" /etc/ntp.conf




#actualizacion sistema
apt-get update; apt-get upgrade -y

#Primero debemos desinstalar primeramente la versión anterior en caso de tenerla:


sudo apt-get remove --purge libreoffice* -y
sudo apt-get clean -y
sudo apt-get autoremove -y

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


#instalacion VIM
apt-get install vim -y

#instalacion net-tools
apt-get install net-tools -y

#instalacion OpenVpn
apt-get install network-manager-openvpn -y

#instalador Paint
apt-get install gpaint -y

#instalacion thunderbird
#apt-get install thunderbird thunderbird-locale-es -y

#instalacion snapd
apt-get install snapd -y

#instalacion skype
#snap install skype --classic 

#instalacion ssh
apt-get install ssh -y

#instalacion simple scan
apt-get install simple-scan -y

#instalacion GIT
apt-get install git -y

#instalacion Ekiga
apt-get install ekiga -y
#instalar impresora
#apt-get install libcups2-dev libcupsimage2-dev -y
#git clone https://github.com/Dileepkv/XP-58.git
#mkdir /usr/share/cups/model/xprinter
#cp XP-58/XP-58.ppd /usr/share/cups/model/xprinter/
#cp XP-58/rastertoxp58 /usr/lib/cups/filter/
#chmod 755 /usr/lib/cups/filter/rastertoxp58

#instalacion osc-inventory
apt-get install ocsinventory-agent -y
echo "server=http://ocsinventory.mundopacifico.cl/ocsinventory" >/etc/ocsinventory/ocsinventory-agent.cfg
ocsinventory-agent

#programacion servicio ocsinventory

#instalacion teamviewer host 15
wget https://download.teamviewer.com/download/linux/version_15x/teamviewer-host_amd64.deb
dpkg -i teamviewer-host_amd64.deb

#instalacion Google Chrome
apt-get install gdebi-core -y
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
gdebi -n google-chrome-stable_current_amd64.deb

#eliminar repositorio teamviewer
rm /etc/apt/sources.list.d/teamviewer.list

#instalacion wallpaper
wget observium.pacificored.cl/wallpapers.tar.gz
tar zxvf wallpapers.tar.gz
cp -rp images/ /usr/share/wallpapers/Next/contents/

#Shutter
sudo add-apt-repository -y ppa:linuxuprising/shutter
sudo apt install shutter -y

#instalacion scanner
#wget https://ftp.hp.com/pub/softlib/software13/printers/SS/SL-C4010ND/uld_V1.00.39_01.17.tar.gz
#tar zxvf uld_V1.00.39_01.17.tar.gz 
#cd uld/
#sh install-scanner.sh

#repo samsung
#echo "deb https://www.bchemnet.com/suldr/ debian extra" >> /etc/apt/sources.list.d/samsung-driver.list
#wget http://www.bchemnet.com/suldr/pool/debian/extra/su/suldr-keyring_2_all.deb
#dpkg -i suldr-keyring_2_all.deb
#apt-get update
#apt-get install suld-scanner-usblp-fix -y

#ingreso al dominio

apt-get install krb5-user samba sssd chrony realmd smbclient cifs-utils -y
echo "192.168.100.32    zeus.pacificored.cl zeus" >> /etc/hosts
echo "192.168.100.62    sr000116.pacificored.cl sr000116" >> /etc/hosts
wget observium.pacificored.cl/config.tar.gz
tar zxvf config.tar.gz
cp config/smb.conf /etc/samba/
cp config/sssd.conf /etc/sssd/
chmod 600 /etc/sssd/sssd.conf
cp config/krb5.conf /etc/
cp config/common-session /etc/pam.d/
echo "%Remote_Admin ALL=(ALL) ALL" >/etc/sudoers.d/sudoers
systemctl restart chrony.service ; systemctl restart smbd.service nmbd.service ; systemctl start sssd.service
echo "Ingrese su usuario: "
read usuario
kinit $usuario
net ads join -k

#bloqueo USB-Storage
ls -l /lib/modules/$(uname -r)/kernel/drivers/usb/storage/usb-storage.ko
modprobe -r usb-storage
mv -v /lib/modules/$(uname -r)/kernel/drivers/usb/storage/usb-storage.ko /root/
echo "#Blockeo USB-Storage" >> /etc/modprobe.d/blacklist.conf
echo "blacklist usb-storage" >> /etc/modprobe.d/blacklist.conf


#Stacer 

sudo add-apt-repository ppa:oguzhaninan/stacer -y
sudo apt-get install stacer -y

#Agente Wazuh
wget http://observium.pacificored.cl/wazuh.sh
sudo sh wazuh.sh



#*ACTUALIZACION AUTOMATICA*

#Istalar unattended upgrades
apt-get install unattended-upgrades apt-listchanges

#Descomentar  para habilitar updates de paquetes y programas
sed -i '/"${distro_id}:${distro_codename}-updates";/s/^../ /' /etc/apt/apt.conf.d/50unattended-upgrades
sed -i '/"${distro_id}:${distro_codename}-proposed";/s/^../ /' /etc/apt/apt.conf.d/50unattended-upgrades
sed -i '/"${distro_id}:${distro_codename}-backports";/s/^../ /' /etc/apt/apt.conf.d/50unattended-upgrades

#Comentar black-list para que no impida actualizar en Kubuntu 21
sed -i '/Unattended-Upgrade::Package-Blacklist {/s/^/# /' /etc/apt/apt.conf.d/50unattended-upgrades
sed -i '0,/};/!{0,/};/s/^/#/}'  /etc/apt/apt.conf.d/50unattended-upgrades


#Descomentar para habilitar dpkg --force-confold --configure -a
sed -i '/Unattended-Upgrade::AutoFixInterruptedDpkg "true";/s/^../ /' /etc/apt/apt.conf.d/50unattended-upgrades 
sed -i '/Unattended-Upgrade::AutoFixInterruptedDpkg "false";/s/^../ /' /etc/apt/apt.conf.d/50unattended-upgrades 

#Cambiar de false a true para usar dpkg --force-confold --configure -a
sed -i '/Unattended-Upgrade::AutoFixInterruptedDpkg "false";/s/false/true/' /etc/apt/apt.conf.d/50unattended-upgrades

#Descomentar  para habilitar apt auto-remove
sed -i '/Unattended-Upgrade::Remove-Unused-Dependencies "false";/s/^../ /' /etc/apt/apt.conf.d/50unattended-upgrades 
sed -i '/Unattended-Upgrade::Remove-Unused-Dependencies "true";/s/^../ /' /etc/apt/apt.conf.d/50unattended-upgrades 

#Cambiar de false a true para habilitar apt auto-remove
sed -i '/Unattended-Upgrade::Remove-Unused-Dependencies "false";/s/false/true/' /etc/apt/apt.conf.d/50unattended-upgrades 

#Crear archivo /etc/apt/apt.conf.d/02periodic
touch /etc/apt/apt.conf.d/02periodic  

#configuracion de 02periodic
echo '// Control parameters for cron jobs by /etc/cron.daily/apt-compat //' >> /etc/apt/apt.conf.d/02periodic  


echo '// Enable the update/upgrade script (0=disable)' >> /etc/apt/apt.conf.d/02periodic  
echo 'APT::Periodic::Enable "1";' >> /etc/apt/apt.conf.d/02periodic  


echo '// Do "apt-get update" automatically every n-days (0=disable)' >> /etc/apt/apt.conf.d/02periodic  
echo 'APT::Periodic::Update-Package-Lists "1";' >> /etc/apt/apt.conf.d/02periodic  


echo '// Do "apt-get upgrade --download-only" every n-days (0=disable)' >> /etc/apt/apt.conf.d/02periodic  
echo 'APT::Periodic::Download-Upgradeable-Packages "1";' >> /etc/apt/apt.conf.d/02periodic  


echo '// Run the "unattended-upgrade" security upgrade script' >> /etc/apt/apt.conf.d/02periodic  
echo '// every n-days (0=disabled)' >> /etc/apt/apt.conf.d/02periodic  
echo '// Requires the package "unattended-upgrades" and will write' >> /etc/apt/apt.conf.d/02periodic  
echo '// a log in /var/log/unattended-upgrades' >> /etc/apt/apt.conf.d/02periodic  
echo 'APT::Periodic::Unattended-Upgrade "1";' >> /etc/apt/apt.conf.d/02periodic  


echo '// Do "apt-get autoclean" every n-days (0=disable)' >> /etc/apt/apt.conf.d/02periodic  
echo 'APT::Periodic::AutocleanInterval "7";' >> /etc/apt/apt.conf.d/02periodic  


echo '// Send report mail to root' >> /etc/apt/apt.conf.d/02periodic  
echo '//     0:  no report             (or null string)' >> /etc/apt/apt.conf.d/02periodic   
echo '//     1:  progress report       (actually any string)' >> /etc/apt/apt.conf.d/02periodic  
echo '//     2:  + command outputs     (remove -qq, remove 2>/dev/null, add -d)' >> /etc/apt/apt.conf.d/02periodic  
echo '//     3:  + trace on' >> /etc/apt/apt.conf.d/02periodic  
echo 'APT::Periodic::Verbose "0";' >> /etc/apt/apt.conf.d/02periodic  

#Crear y configurar  /etc/systemd/system/apt-daily.timer.d/override.conf 

mkdir /etc/systemd/system/apt-daily.timer.d/
touch  /etc/systemd/system/apt-daily.timer.d/override.conf
echo "[Timer]" >>  /etc/systemd/system/apt-daily.timer.d/override.conf
echo "OnCalendar=" >>  /etc/systemd/system/apt-daily.timer.d/override.conf
echo "OnCalendar=13:00" >> /etc/systemd/system/apt-daily.timer.d/override.conf 
echo "RandomizedDelaySec=0" >>  /etc/systemd/system/apt-daily.timer.d/override.conf

#Crear y configurar /etc/systemd/system/apt-daily-upgrade.timer.d/override.conf

mkdir /etc/systemd/system/apt-daily-upgrade.timer.d/
touch  /etc/systemd/system/apt-daily-upgrade.timer.d/override.conf
echo "[Timer]" >>  /etc/systemd/system/apt-daily-upgrade.timer.d/override.conf
echo "OnCalendar=" >>  /etc/systemd/system/apt-daily-upgrade.timer.d/override.conf
echo "OnCalendar=13:00" >> /etc/systemd/system/apt-daily-upgrade.timer.d/override.conf 
echo "RandomizedDelaySec=0" >> /etc/systemd/system/apt-daily-upgrade.timer.d/override.conf 

#Volver a actualizar equipo 
unattended-upgrade -d 

