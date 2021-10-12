#####
# 必须联合使用以下策略进行删除，否则无法实现删除，一直处于 Terminating...
#####
kubectl delete -f dashboard-v2.2.0.yaml
echo
sleep 10

echo '---- deleting force ...'
kubectl delete --force --grace-period=0 deployment kubernetes-dashboard --namespace=kubernetes-dashboard
kubectl delete --force --grace-period=0 service kubernetes-dashboard --namespace=kubernetes-dashboard
kubectl delete --force --grace-period=0 sa kubernetes-dashboard --namespace=kubernetes-dashboard

kubectl delete --force --grace-period=0 role kubernetes-dashboard-minimal --namespace=kubernetes-dashboard
kubectl delete --force --grace-period=0 rolebinding kubernetes-dashboard-minimal --namespace=kubernetes-dashboard

kubectl delete --force --grace-period=0 secret kubernetes-dashboard-certs --namespace=kubernetes-dashboard
kubectl delete --force --grace-period=0 secret kubernetes-dashboard-csrf --namespace=kubernetes-dashboard
kubectl delete --force --grace-period=0 secret kubernetes-dashboard-key-holder --namespace=kubernetes-dashboard
echo
sleep 10


#echo '---- finalize....'
## 匿名管理员
#kubectl create clusterrolebinding test:anonymous --clusterrole=cluster-admin --user=system:anonymous
#kubectl get ns kubernetes-dashboard -o json >kubernetes-dashboard-ns.json
#curl -k -H "Content-Type:application/json" -X PUT --data-binary @kubernetes-dashboard-ns.json https://localhost:6443/api/v1/namespaces/kubernetes-dashboard/finalize

kubectl get namespaces | grep kubernetes-dashboard
echo '---- well done 😁 ----'
