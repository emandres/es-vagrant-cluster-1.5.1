# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
  end

  config.vm.provision "shell", path: "provision/bootstrap.sh"

  config.vm.define "coordinator" do |coord|
    coord.vm.network "private_network", ip: "192.168.66.100"
    coord.vm.provision "shell", path: "provision/coordinator.sh"
  end

  config.vm.define "es1" do |es1|
    es1.vm.network "private_network", ip: "192.168.66.101"
  end

  config.vm.define "es2" do |es2|
    es2.vm.network "private_network", ip: "192.168.66.102"
  end

  config.vm.define "es3" do |es3|
    es3.vm.network "private_network", ip: "192.168.66.103"
  end

end
