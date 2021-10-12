# 使用命令创建一次Release
helm install hello-world hello-world-chart.zip

# 修改配置文件内容之后可以通过如下命令更新
helm upgrade nobby-eel .

# 查看历史信息
helm history nobby-eel

# 查询一个特定的Release的状态
helm status nobby-eel

# 尝试运行
helm install --dry-run .

# 移除所有与这个Release相关的Kubernetes资源
helm delete nobby-eel

# 还原删除的helm服务或者回滚已经存在的服务操作
helm rollback nobby-eel 2
helm rollback nobby-eel 4

# 使用命令移除所有与指定Release相关的Kubernetes资源和所有这个Release的记录
helm delete --purge nobby-eel
helm list --deleted
