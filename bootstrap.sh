#!/usr/bin/env bash

# Actualizar paquetes instalados
apt-get update
#apt-get -y upgrade

# Configurar locale
locale-gen es_ES.UTF-8
update-locale LANG=es_ES.UTF-8 LC_MESSAGES=POSIX

# Editar /etc/hosts
# IMPORTANTE: usa a nomenclatura indicada nas prácticas
# Se non hai entradas de execucións previas
if [[ ! $(grep "192.168.1" "/etc/hosts") ]]; then
 # Inserir as liñas iniciais 
 echo >> /etc/hosts
 echo "# XXXXXXXXXX-cluster" >> /etc/hosts
else
 # Eliminar as entradas de execucións previas
 sed -i "/192.168.1/d" /etc/hosts
fi
echo "192.168.1.2 XXXXXXXXXX-master" >> /etc/hosts
echo "192.168.1.3 XXXXXXXXXX-slave" >> /etc/hosts
echo "192.168.1.4 XXXXXXXXXX-spare" >> /etc/hosts
