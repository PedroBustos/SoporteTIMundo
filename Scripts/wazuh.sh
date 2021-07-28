#!/bin/bash
apt-get update
apt-get install apt-transport-https curl gnupg gnupg2 gnupg1 -y
curl -s https://packages.wazuh.com/key/GPG-KEY-WAZUH | apt-key add -
echo "deb https://packages.wazuh.com/4.x/apt/ stable main" | tee -a /etc/apt/sources.list.d/wazuh.list
apt-get update
WAZUH_MANAGER="192.168.100.12" apt-get install wazuh-agent -y
systemctl daemon-reload
systemctl enable wazuh-agent.service
systemctl start wazuh-agent.service
echo "Agente Wazuh instalado"

