#!/bin/sh

BASE_DIR="/vagrant/terraform/vmware"
cp ssl/ca.pem ssl/openid-ca.pem
ansible -i $BASE_DIR/config/hosts.ini all -m copy -a "src=ssl/openid-ca.pem dest=/etc/kubernetes/ssl/openid-ca.pem" -b -u terraform

ansible -i $BASE_DIR/config/hosts.ini all -m file -a "path=/etc/kubernetes/ssl/loginapp/ state=directory" -b -u terraform
ansible -i $BASE_DIR/config/hosts.ini all -m copy -a "src=ssl/key.pem dest=/etc/kubernetes/ssl/loginapp/key.pem" -b -u terraform
ansible -i $BASE_DIR/config/hosts.ini all -m copy -a "src=ssl/cert.pem dest=/etc/kubernetes/ssl/loginapp/cert.pem" -b -u terraform

# ansible -i /vagrant/terraform/vmware/config/hosts.ini all -m file -a "path=/etc/kubernetes/ssl/openid-ca.pem state=absent" -b -u terraform
# ansible -i /vagrant/terraform/vmware/config/hosts.ini all -m file -a "path=/etc/kubernetes/ssl/loginapp/ state=directory state=absent" -b -u terraform