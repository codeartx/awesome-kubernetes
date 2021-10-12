#####
# 安装 helm
#####
# mac 上安装 helm 客户端
brew install kubernetes-helm

# 添加镜像 更新速度：微软 > 阿里云
# 40.73.39.89 mirror.azure.cn # 加上此host，否则会 403
helm repo add stable http://mirror.azure.cn/kubernetes/charts/
helm repo update


