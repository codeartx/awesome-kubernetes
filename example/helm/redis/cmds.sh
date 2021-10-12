#####
# helm 部署 redis
# https://artifacthub.io/packages/helm/bitnami/redis
#####
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install redis bitnami/redis


