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
  config.vm.box = "ubuntu/xenial64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 443, host: 8443
  config.vm.network "forwarded_port", guest: 8080, host: 8081

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
     # Display the VirtualBox GUI when booting the machine
     # vb.gui = true

     # Customize the amount of memory on the VM:
     vb.memory = "4096"
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", inline: <<-SHELL
     sudo apt-get update
     sudo apt-get install -y python-pip
     sudo pip install virtualenv

     sudo cp /vagrant/id_rsa* /home/vagrant/.ssh/
     sudo chown vagrant:vagrant /home/vagrant/.ssh/id_rsa*
     cat /vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
     #ln -s /vagrant/ansible /etc/ansible

     sudo cp /vagrant/id_rsa* /root/.ssh/
     cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys

     virtualenv --python=python3.5 /opt/venvs/vmk8s
     source /opt/venvs/vmk8s/bin/activate
     pip install ansible
     pip install netaddr
     
     # Install terraform
     cd ~
     wget https://releases.hashicorp.com/terraform/0.11.8/terraform_0.11.8_linux_amd64.zip 
     sudo apt-get install -y unzip jq git
     sudo unzip terraform_0.11.8_linux_amd64.zip 
     sudo cp terraform /usr/local/bin/
     
     # install kubectl
     curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | \
     sudo apt-key add -
     
     echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" >> /etc/apt/sources.list.d/kubernetes.list   
     sudo apt-get update
     sudo apt-get -y install kubectl
     
     curl https://raw.githubusercontent.com/helm/helm/v2.11.0/scripts/get | bash
     helm init
     
     wget https://dl.google.com/go/go1.11.1.linux-amd64.tar.gz
     tar xvf go1.11.1.linux-amd64.tar.gz
     sudo mv go /usr/local

     cat > /vagrant/bash_profile <<EOF
     >export GOROOT=/usr/local/go
     >export GOPATH=$HOME/work
     >export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
     >EOF
     cp /vagrant/bash_profile ~/.bash_profile
     source ~/.bash_profile 
     go version
     
     
  SHELL
end
