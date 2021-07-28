#!/bin/bash
wget https://hadler.me/files/forticlient-sslvpn_4.4.2333-1_amd64.deb
dpkg -i forticlient-sslvpn_4.4.2333-1_amd64.deb
/opt/forticlient-sslvpn/forticlientsslvpn.sh
