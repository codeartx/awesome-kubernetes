echo '----- 创建 HPA 对象 ...'
kubectl autoscale deployment nginx-hpa --cpu-percent=10 --min=1 --max=10
echo

echo '----- 增加负载 ...'
curTime=`date '+%s'`

while true; do
	wget -q -O- http://localhost:30001;
done


Kubernetes HPA 使用详解
