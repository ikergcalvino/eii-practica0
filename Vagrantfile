# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "xoan/Leap-15.4"

  # evitamos actualizacións automáticas
  config.vm.box_check_update = false
  config.vbguest.auto_update = false

  # Activamos a opción de linked clones para optimizar o espazo usado polos discos
  # As 3 VM comparten o disco dunha imaxe base e en cada unha só se almacenan os cambios
  config.vm.provider :virtualbox do |vb|
    vb.linked_clone = true
  end

  # Definición dos nós do cluster

  ###################### IMPORTANTE #############################
  # Cámbia os nomes das VM para usar a nomenclatura das practicas 
  ###############################################################

  # VM master
  config.vm.define "XXXXXXXXXX-master" do |master|
    master.vm.network "private_network", ip: "192.168.56.2"
    # aprovisionar o master
    master.vm.provision "shell" do |s|
      s.path = "bootstrap.sh"
      s.args = ["XXXXXXXXXX-master"]
    end
  end

  # VM slave
  config.vm.define "XXXXXXXXXX-slave" do |slave|
    slave.vm.network "private_network", ip: "192.168.56.3"
    # aprovisionar o slave
    slave.vm.provision "shell" do |s|
      s.path = "bootstrap.sh"
      s.args = ["XXXXXXXXXX-slave"]
    end
  end

  # VM spare
  config.vm.define "XXXXXXXXXX-spare" do |spare|
    spare.vm.network "private_network", ip: "192.168.56.4"
    # aprovisionar o spare
    spare.vm.provision "shell" do |s|
      s.path = "bootstrap.sh"
      s.args = ["XXXXXXXXXX-spare"]
    end
  end

end
