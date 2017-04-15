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

  #if Vagrant.has_plugin?("vagrant-proxyconf")
   # config.proxy.http     = "http://172.21.4.10:3128/"
    #config.proxy.https    = "http://172.21.4.10:3128/"
    #config.proxy.no_proxy = "localhost,127.0.0.1"
  #end

  config.vm.box = "chef_base"

   #config.vm.provision :shell, :inline => "sudo apt-get update -y"

   #config.vm.provision :shell, :inline => "sudo apt-get install vim ntp daemon git maven -y"

  #config.vm.provision :shell, :inline => "sudo service ntp restart"

  #config.vm.provision :shell, :path => "./install_java8.sh"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", 1024] 
    # vb.gui = true
   end

   # config.vm.provider "virtualbox" do |vb|
   #   ### Change network card to PCnet-FAST III
   #   # For NAT adapter
   #   vb.customize ["modifyvm", :id, "--nictype1", "Am79C973"]
   # end

   config.vm.define :jenkins_master do |vm_config|
    vm_config.vm.network "private_network", ip: "33.33.32.2"
    vm_config.vm.hostname = "jenkins-master.capgemini.com"
    config.vm.provision :shell, :path => "./jenkins_install.sh"
    vm_config.vm.network "forwarded_port", guest: 8080, host: 8080
   end

   config.vm.define :jenkins_slave do |vm_config|
    vm_config.vm.network "private_network", ip: "33.33.32.3"
    vm_config.vm.hostname = "jenkins-slave.capgemini.com"
    config.vm.provision :shell, :inline => "sudo mkdir -p /apps"
    config.vm.provision :shell, :inline => "sudo chown -Rfv vagrant:vagrant /apps"
   end

   config.vm.define :chef_node_1 do |vm_config|
    vm_config.vm.network "private_network", ip: "33.33.32.4"
    vm_config.vm.hostname = "chef-node-1.capgemini.com"
    #config.vm.provision :shell, :inline => "sudo mkdir -p /apps"
    #config.vm.provision :shell, :inline => "sudo chown -Rfv vagrant:vagrant /apps"
   end

   config.vm.define :chef_node_2 do |vm_config|
    vm_config.vm.network "private_network", ip: "33.33.32.5"
    vm_config.vm.hostname = "chef-node-2.capgemini.com"
    #config.vm.provision :shell, :inline => "sudo mkdir -p /apps"
    #config.vm.provision :shell, :inline => "sudo chown -Rfv vagrant:vagrant /apps"
   end

   # add slave via launch command on slave
   # Step1: obtain slave jar: http://your-Jenkins-server:port/jnlpJars/slave.jar 
   # Step2: java -jar slave.jar -jnlpUrl http://Your-Jenkins-Server:port/computer/slave-name/slave-agent.jnlp


end
