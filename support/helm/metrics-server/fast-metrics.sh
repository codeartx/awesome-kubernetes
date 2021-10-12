# 查询 metrics
kubectl get --raw "/apis/metrics.k8s.io/v1beta1/nodes"

# top xxx
kubectl top pod --all-namespaces
kubectl top node
