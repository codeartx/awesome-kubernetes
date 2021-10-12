# CentOS7 搭建 NFS 服务器 http://www.mydlq.club/article/3/

# 停止并禁用防火墙
systemctl stop firewalld
systemctl disable firewalld

# 关闭并禁用SELinux
setenforce 0
sed -i 's/^SELINUX=enforcing$/SELINUX=disabled/' /etc/selinux/config

# 安装nfs-utils和rpcbind
yum install -y nfs-utils rpcbind

# 创建文件夹
mkdir /nfs
chown -R nfsnobody:nfsnobody /nfs
