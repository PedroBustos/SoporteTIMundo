#/!bin/bash

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
