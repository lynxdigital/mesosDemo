# -*- mode: ruby -*-
# vi: set ft=ruby :

# VagrantFile To Build Mesos Master/Slave Environment
# Geoffrey Harrison

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Define Master Machine
  config.vm.define "master" do |master|
    master.vm.box = "master"
    master.vm.hostname = "master.local"
    master.vm.box = "chef/centos-6.5"
    config.vm.provider "virtualbox" do |v|
      v.memory = 512
      v.cpus = 1
    end
    master.vm.network "forwarded_port", guest: 8080, host: 8080
    master.vm.network "forwarded_port", guest: 5000, host: 5000
    master.vm.network "forwarded_port", guest: 80, host:8888
    master.vm.network "private_network", ip: "192.168.58.201"
    master.vm.provision :shell, path: "master/bootstrap.sh"
  end

  # Define Slave1 Machine
  config.vm.define "slave" do |slave|
    slave.vm.box = "slave1"
    slave.vm.hostname = "slave1.local"
    slave.vm.box = "chef/centos-6.5"
    config.vm.provider "virtualbox" do |v|
      v.memory = 512
      v.cpus = 1
    end
    slave.vm.network "private_network", ip: "192.168.58.211"
    slave.vm.provision :shell, path: "slave/bootstrap.sh"
  end

  ## Define Slave2 Machine
  #config.vm.define "slave2" do |slave|
  #  slave.vm.box = "slave2"
  #  slave.vm.hostname = "slave2.local"
  #  slave.vm.box = "chef/centos-6.5"
  #  config.vm.provider "virtualbox" do |v|
  #    v.memory = 512
  #    v.cpus = 1
  #  end
  #  slave.vm.network "private_network", ip: "192.168.58.212"
  #  slave.vm.provision :shell, path: "slave/bootstrap.sh"
  #end

  ## Define Slave3 Machine
  #config.vm.define "slave3" do |slave|
  #  slave.vm.box = "slave3"
  #  slave.vm.hostname = "slave3.local"
  #  slave.vm.box = "chef/centos-6.5"
  #  config.vm.provider "virtualbox" do |v|
  #    v.memory = 512
  #    v.cpus = 1
  #  end
  #  slave.vm.network "private_network", ip: "192.168.58.213"
  #  slave.vm.provision :shell, path: "slave/bootstrap.sh"
  #end

end
