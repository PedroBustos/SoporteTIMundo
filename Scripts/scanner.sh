#!/bin/bash

#instalacion scanner
wget https://ftp.hp.com/pub/softlib/software13/printers/SS/SL-C4010ND/uld_V1.00.39_01.17.tar.gz
tar zxvf uld_V1.00.39_01.17.tar.gz 
cd uld/
sh install-scanner.sh

