#!/bin/bash

function kuse() {
  rm ~/.kube/config
  KUBE_ENV=$1
  [ -z "$KUBE_ENV" ] && echo "Need to pass kube env" && KUBE_ENV="admin";
  echo "KUBE_ENV: $KUBE_ENV"

  my_env=$KUBE_ENV
  mkdir ~/.kube
  cp /vagrant/terraform/vmware/config/$my_env.conf  ~/.kube/config

  #kubectl config get-contexts
  kubectl config current-context
  kubectl cluster-info
  #kubectl get nodes
}
