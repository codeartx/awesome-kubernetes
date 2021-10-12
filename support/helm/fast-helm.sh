helm search repo redis

# 列出已经部署的Release
helm list

# 修改配置文件内容之后可以通过如下命令更新
helm upgrade appName .

# 查看历史信息
helm history appName

# 查询一个特定的Release的状态
helm status appName

# 尝试运行
helm install --dry-run .

# 移除所有与这个Release相关的Kubernetes资源
helm delete appName

# 还原删除的helm服务或者回滚已经存在的服务操作
helm rollback appName 2
helm rollback appName 4

# 使用命令移除所有与指定Release相关的Kubernetes资源和所有这个Release的记录
helm delete --purge appName
helm list --deleted
------------------------------------------------
--all-namespaces
------------------------------------------------
helm uninstall --namespace kube-system metrics

