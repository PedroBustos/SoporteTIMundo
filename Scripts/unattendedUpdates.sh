#/bin/bash

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
