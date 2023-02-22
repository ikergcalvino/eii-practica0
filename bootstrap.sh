#!/usr/bin/env bash

# Usage: bootstrap.sh <hostname>

# Actualizar paquetes instalados
zypper refresh
#zypper update

# Configurar locale
localectl set-locale LANG=es_ES.UTF-8
localectl set-keymap es

# Configurar NTP
zypper --non-interactive in chrony-pool-openSUSE
systemctl start chronyd.service
systemctl enable chronyd.service

# Editar /etc/hosts
# IMPORTANTE: usa a nomenclatura indicada nas practicas
# Se non hai entradas de execucions previas
if [[ ! $(grep "192.168.56" "/etc/hosts") ]]; then
 # Inserir as linhas iniciais 
 echo >> /etc/hosts
 echo "# igc2223-cluster" >> /etc/hosts
else
 # Eliminar as entradas de execucions previas
 sed -i "/192.168.56/d" /etc/hosts
fi
echo "192.168.56.2 igc2223-master" >> /etc/hosts
echo "192.168.56.3 igc2223-slave" >> /etc/hosts
echo "192.168.56.4 igc2223-spare" >> /etc/hosts

# Configurar hostname
hostnamectl hostname $1

# Instalar crmsh e dependencias (csync2, pacemaker, corosync, ...)
zypper --non-interactive in crmsh