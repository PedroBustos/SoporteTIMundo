#!/bin/bash	

# Agregar en cron tarea para realizar check de particiones en cada inicio
echo "00 13 * * * root touch /forcefsck" >> /etc/crontab
