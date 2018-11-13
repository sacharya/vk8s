#!/bin/bash

kubectl create secret tls kubedashboard.furiouscat.com.tls --cert=../k8s-ldap/ssl/cert.pem --key=../k8s-ldap/ssl/key.pem -n kube-system
