echo '---- starting rancher...'
docker run -d --restart=unless-stopped \
	-p 2080:80 -p 2443:443 \
	--name rancher \
	--privileged \
	rancher/rancher:v2.4.4
echo

sleep 20
# 必须使用内网ip，外网ip可能无法访问端口，localhost导入本地集群、启动 agent 时会报错
innerIp=$(ifconfig | grep 192 | awk {'print $2'})
url=https://${innerIp}:2443

echo '---- open rancher...'
echo $url
open $url
