# Web 界面 (Dashboard) https://kubernetes.io/zh/docs/tasks/access-application-cluster/web-ui-dashboard/
echo '---- staring kubernetes-dashboard:v2.2.0 ...'
kubectl apply -f ./dashboard-v2.2.0.yaml
echo

sleep 10
ns=kubernetes-dashboard
defaultAccount=`kubectl get secrets -n $ns | grep default-token | awk '{print $1}'`
token=`kubectl get secrets ${defaultAccount} -n $ns -o jsonpath={.data.token} | base64 -d `

echo "$ns 默认账户：" $defaultAccount
echo "$ns 默认token：" $token

#echo
echo '---- 打开 dashboard'
echo https://localhost:31443
open https://localhost:31443
