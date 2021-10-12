# 添加污点：不能部署测试类服务
kubectl taint nodes docker-desktop app=test:NoSchedule

# 移除污点
# kubectl taint nodes docker-desktop app=test:NoSchedule-


