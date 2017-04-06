# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048  
  end

  config.vm.define "ubuntu" do |ubuntu|
    ubuntu.vm.box = "ubuntu/trusty64"
    ubuntu.vm.provision :shell, path: "bootstrap.sh"
    ubuntu.vm.network "forwarded_port", guest: 80, host: 8080
    ubuntu.vm.network "forwarded_port", guest: 8888, host: 8888
    ubuntu.vm.network "private_network", ip: "192.168.33.10"
  end
  

end
