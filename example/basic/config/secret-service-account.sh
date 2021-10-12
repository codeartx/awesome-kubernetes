kubectl get pods -n kube-system

kubectl exec -n kube-system kube-proxy-7f8nh -- \
    ls /run/secrets/kubernetes.io/serviceaccount

kubectl exec -n kube-system kube-proxy-7f8nh -- \
    cat /run/secrets/kubernetes.io/serviceaccount/ca.crt

kubectl exec -n kube-system kube-proxy-7f8nh -- \
    cat /run/secrets/kubernetes.io/serviceaccount/token
