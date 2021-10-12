echo '---- unsinstalling rancher ...'
docker rm -f rancher --volumes
echo

echo '---- clean resources in k8s ...'
#####
# 删除Rancher的空间cattle-system,状态一直是Terminating https://blog.51cto.com/michaelkang/2435467
#####
kubectl patch namespace cattle-system -p '{"metadata":{"finalizers":[]}}' --type='merge' -n cattle-system
kubectl delete namespace cattle-system --grace-period=0 --force

kubectl patch namespace cattle-global-data -p '{"metadata":{"finalizers":[]}}' --type='merge' -n cattle-system
kubectl delete namespace cattle-global-data --grace-period=0 --force

kubectl patch namespace local -p '{"metadata":{"finalizers":[]}}' --type='merge' -n cattle-system
for resource in `kubectl api-resources --verbs=list --namespaced -o name | xargs -n 1 kubectl get -o name -n local`; do kubectl patch $resource -p '{"metadata": {"finalizers": []}}' --type='merge' -n local; done
kubectl delete namespace local --grace-period=0 --force
echo

echo '---- well done 👌 ...'
