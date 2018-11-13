#!/bin/bash
kubectl create -f nginx.yaml 

if [[ $(kubectl get pods --all-namespaces | grep -vi Running | wc -l) -ne 0 ]]; then 
  echo "Nginx not stable yet? $(kubectl get pods --all-namespaces | grep -vi Running | wc -l)"
  sleep 10
fi
url=""
if [ -z "$1" ]; then
  #echo "Usage: `basename $0` [URL]"
  #exit
  host=$(kubectl get ingress nginx-app-ingress -n ingress-nginx -o json | jq -j '.spec.rules[0].host')
  path=$(kubectl get ingress nginx-app-ingress -n ingress-nginx -o json | jq -j '.spec.rules[0].http.paths[0].path')
  url="http://$host$path"
else
  url=$1
fi

echo "Processing url $url"

mv nginx-curl-status nginx-curl-status.back-$(date '+%s')
touch nginx-curl-status

while true; do
  status=$(curl -Is $url | head -n 1)    
  echo "$(date)               $status" | tee -a  nginx-curl-status
  sleep 1
done
