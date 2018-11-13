kubectl -n kube-system describe secrets    `kubectl -n kube-system get secrets | awk '/clusterrole-aggregation-controller/ {print $1}'`  | awk '/token:/ {print $2}'

echo "https://10.127.83.121:6443/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/login"
