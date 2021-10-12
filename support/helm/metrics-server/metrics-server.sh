#####
# 指标聚合服务
#
# bitnami/metrics-server
# https://artifacthub.io/packages/helm/bitnami/metrics-server
#####
helm install metrics bitnami/metrics-server -n metrics-server \
	--namespace kube-system \
	-f metrics-server.yaml



