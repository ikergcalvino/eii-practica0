# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/bionic64"
  config.vm.box_version = "20210916.0.0"
  config.vm.box_check_update = false

  # script de aprovisionamento común
  config.vm.provision :shell, path: "bootstrap.sh"

  # Activamos a opción de linked clones para optimizar o espazo usado polos discos
  # As 3 VMs comparten o disco dunha imaxe base e en cada unha só se almacenan os cambios
  config.vm.provider :virtualbox do |vb|
    vb.linked_clone = true
  end

  # Definición dos nós do cluster

  ###################### IMPORTANTE ########################
  # Cámbialles o nome para usar a nomenclatura das practicas 
  ##########################################################

  # VM master
  config.vm.define "XXXXXXXXXX-master" do |master|
    master.vm.network "private_network", ip: "192.168.1.2"
    # nomear o nodo e instalar corosync/pacemaker
    master.vm.provision "shell", inline: <<-SHELL
      hostnamectl set-hostname XXXXXXXXXX-master
      apt-get install -y crmsh csync2
    SHELL
  end

  # VM slave
  config.vm.define "XXXXXXXXXX-slave" do |slave|
    slave.vm.network "private_network", ip: "192.168.1.3"
    # nomear o nodo e instalar corosync/pacemaker
    slave.vm.provision "shell", inline: <<-SHELL
      hostnamectl set-hostname XXXXXXXXXX-slave
      apt-get install -y crmsh csync2
    SHELL
  end

  # VM spare
  config.vm.define "XXXXXXXXXX-spare" do |spare|
    spare.vm.network "private_network", ip: "192.168.1.4"
    # nomear o nodo e instalar corosync/pacemaker
    spare.vm.provision "shell", inline: <<-SHELL
      hostnamectl set-hostname XXXXXXXXXX-spare
      apt-get install -y crmsh csync2
    SHELL
  end

end
