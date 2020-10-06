#!/usr/bin/env bash

# Actualizar paquetes instalados
apt-get update
apt-get -y upgrade

# Configurar locale
locale-gen es_ES.UTF-8
update-locale LANG=es_ES.UTF-8 LC_MESSAGES=POSIX

# Editar /etc/hosts
# IMPORTANTE: usa a nomenclatura indicada nas prácticas
echo >> /etc/hosts
echo "# XXXXXXXXXX-cluster" >> /etc/hosts
echo "193.168.1.2 XXXXXXXXXX-master" >> /etc/hosts
echo "193.168.1.3 XXXXXXXXXX-slave" >> /etc/hosts
echo "193.168.1.4 XXXXXXXXXX-spare" >> /etc/hosts
