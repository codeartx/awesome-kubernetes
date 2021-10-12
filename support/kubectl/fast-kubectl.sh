阿里云
	47.104.16.212（公）
	172.31.169.4（私有）
------------------------------------------------
客户端
命令行 kubectl
语法：kubectl [command] [TYPE] [NAME] [flags]
command 对资源的操作
	create - 创建资源

	delete - 删除资源
	get - 列出资源
		参数
			-o 格式类型 : 自定义输出格式
				wide : 附加信息
				yaml : YAML 格式
			-w : 动态更新
	apply - 运行资源
	rollout
	---- 调试
	describe - 显示详细状态
	logs - 打印日志
	----
	exec - 运行命令
	----
	autoscale hpa
TYPE 资源类型
	cluster-info - 集群状态
	namespaces - ns - 命名空间
	nodes - no - 节点
	pods - po - 容器封装
	jobs
	cronjobs
	----
	secrets - 安全
	serviceaccounts - sa - 服务帐户
	----
	configmaps - cm - 配置文档
	persistentvolumeclaims - pvc - 存储卷声明
	persistentvolumes - pv - 存储卷
	----
	deployments - deploy - 布署控制器
	statefulsets - sts - 状态集控制器
	daemonsets - ds - 守护控制器
	----
	services - svc - 服务
	ingresses - ing - 入口
	---- 资源
	limitrange

flags 可选参8数
	会覆盖 默认值 与 环境变量
	-n <命名空间> : 指定命名空间
	-c <容器名> : 指定容器
	-l name=<标签名> : 指定标签名
	----
	--all : 所有
	--force : 强制
	-o yaml yaml
污点/容忍------------------------------------------------
# 添加污点
kubectl taint nodes docker-desktop app=test:NoSchedule

# 移除污点
kubectl taint nodes docker-desktop app=test:NoSchedule-
秘钥相关 ------------------------------------------------
kubectl get secret --all-namespaces
------------------------------------------------

ClusterIP
clusterip
index.html

nginx-ingress

emptyDir emptydir

hostPath hostpath

nfs-client-provisioner
kube-system
------------------------------------------------
回滚
kubectl rollout history 检查Deployment部署历史
kubectl rollout undo deployment/… --revision=2

kubectl roollout pause deployment/…
kubectl roollout resume

docker-desktop
【HPA】------------------------------------------------
kubectl autoscale deployment php-apache \
    --cpu-percent=50 --min=1 --max=10
资源限制 ------------------------------------------------
kubectl get limitrange
kubectl describe limitrange -n limited-ns

k8s create namespaces limit-test
------------------------------------------------
k8s describe ns  kubernetes-dashboard
k8s delete ns  cattle-system

k8s -n cattle-system get pods  cattle-cluster-agent-9c9bd8fbb-jv65r
k8s -n cattle-system describe pods  cattle-cluster-agent-9c9bd8fbb-jv65r







k8s get namespaces
















