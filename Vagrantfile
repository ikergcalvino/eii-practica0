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
    vb.cpus = 2
  end

  # Definición dos nós do cluster

  ###################### IMPORTANTE #############################
  # Cámbia os nomes das VM para usar a nomenclatura das practicas 
  ###############################################################

  # VM master
  config.vm.define "igc2223-master" do |master|
    master.vm.network "private_network", ip: "192.168.56.2"
    master.vm.provider :virtualbox do |vb|
      filename = "master-disk2.vdi"
      unless File.exist?(filename)
        vb.customize ["createmedium", "disk", "--filename", filename, "--format", "vdi", "--size", 1 * 1024]
      end
      vb.customize ["storageattach", :id, "--storagectl", "SATA Controller", "--port", 1, "--device", 0, "--type", "hdd", "--medium", filename]
    end
    # aprovisionar o master
    master.vm.provision "shell" do |s|
      s.path = "bootstrap.sh"
      s.args = ["igc2223-master"]
    end
  end

  # VM slave
  config.vm.define "igc2223-slave" do |slave|
    slave.vm.network "private_network", ip: "192.168.56.3"
    slave.vm.provider :virtualbox do |vb|
      filename = "slave-disk2.vdi"
      unless File.exist?(filename)
        vb.customize ["createmedium", "disk", "--filename", filename, "--format", "vdi", "--size", 1 * 1024]
      end
      vb.customize ["storageattach", :id, "--storagectl", "SATA Controller", "--port", 1, "--device", 0, "--type", "hdd", "--medium", filename]
    end
    # aprovisionar o slave
    slave.vm.provision "shell" do |s|
      s.path = "bootstrap.sh"
      s.args = ["igc2223-slave"]
    end
  end

  # VM spare
  config.vm.define "igc2223-spare" do |spare|
    spare.vm.network "private_network", ip: "192.168.56.4"
    # aprovisionar o spare
    spare.vm.provision "shell" do |s|
      s.path = "bootstrap.sh"
      s.args = ["igc2223-spare"]
    end
  end

end
