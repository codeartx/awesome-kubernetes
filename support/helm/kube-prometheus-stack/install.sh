#####
# prometheus 软件栈
# 自动按照：prometheus，kube-state-metrics，prometheus-node-exporter，grafana/grafana
#
# https://artifacthub.io/packages/helm/prometheus-community/kube-prometheus-stack
# chart
# 	https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack
# 	https://github-releases.githubusercontent.com/286108332/7c3e1dc0-843b-4af2-86eb-81d71ee6f24d?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20211007%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20211007T090300Z&X-Amz-Expires=300&X-Amz-Signature=8203a77639d10afce202e9dc41aa16384cb49a9ea17e633268834c563d5640b5&X-Amz-SignedHeaders=host&actor_id=19522324&key_id=0&repo_id=286108332&response-content-disposition=attachment%3B%20filename%3Dkube-prometheus-stack-19.0.2.tgz&response-content-type=application%2Foctet-stream
# helm安装kube-prometheus-stack
# 	https://tomhht.github.io/post/an-zhuang-prometheus-operator/
# bitnami/kube-state-metrics:2.2.0 镜像
# 	https://hub.docker.com/layers/bitnami/kube-state-metrics/2.2.0/images/sha256-abbef94d5aa96e9cd519cd0496bf0b234e93ca924d8984b6f78a75d2f5f5ad16?context=explore
#####

echo '---- 下载镜像...'
# kube-state-metrics，默认从 k8s.gcr.io 下载因为墙的原因会超时
docker pull bitnami/kube-state-metrics:2.2.0
docker tag  bitnami/kube-state-metrics:2.2.0 k8s.gcr.io/kube-state-metrics/kube-state-metrics:v2.2.0
echo

echo '---- 准备 k8s、helm 环境...'
kubectl create namespace monitoring
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
echo

echo '---- 安装 prometheus-stack...'
# 因为墙的原因，远程太慢，建议本地方式
# helm install prometheus-stack prometheus-community/kube-prometheus-stack -f values.yaml -n monitoring
helm install prometheus-stack ./chart -f values.yaml -n monitoring
sleep 15
echo

echo '---- 打开服务...'
# prometheus operator
open http://localhost:30443

# Prometheus
open http://localhost:30090
# alertmanager
open http://localhost:30903

# ---- exporters
# kube-state-metrics
open http://localhost:30100
# node-exporter
open http://localhost:30101

# grafana
#用户名/密码：admin/prom-operator
open http://localhost:30001
