# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Define Master VM
  config.vm.define "master" do |master|
    master.vm.box = "master"
    master.vm.hostname = "master.local"
    master.vm.box = "chef/centos-6.5"
    config.vm.provider "virtualbox" do |v|
      v.memory = 512
      v.cpus = 1
    end
    master.vm.network "forwarded_port", guest: 8080, host: 8080
    master.vm.network "forwarded_port", guest: 5050, host: 5050
    master.vm.network "forwarded_port", guest: 5000, host: 5000
    master.vm.network "private_network", ip: "192.168.58.201"
    master.vm.provision :shell, path: "bootstrap-master.sh"
  end

  # Define Slave VM
  config.vm.define "slave" do |slave|
    slave.vm.box = "slave1"
    slave.vm.hostname = "slave1.local"
    slave.vm.box = "chef/centos-6.5"
    config.vm.provider "virtualbox" do |v|
      v.memory = 512
      v.cpus = 1
    end
    slave.vm.network "private_network", ip: "192.168.58.211"
    slave.vm.provision :shell, path: "bootstrap-slave.sh"
  end

end
