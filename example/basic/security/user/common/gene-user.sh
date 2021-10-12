#####
# 生成任意普通用户
#####
cluster="k8s"
namespace="default"

userDir="user"
username="kk"

echo 'clean old configs...'
rm -r ./$userDir/${username}
mkdir -p ./$userDir/${username}
userDir="./$userDir/${username}"

# 创建请求证书，会自动生csr(证书请求)和key.pem(证书私钥)文件
echo 'gencert ....'
cfssl gencert -ca=./ca/ca.pem -ca-key=./ca/ca-key.pem -profile=$cluster csr.json | cfssljson -bare ./$userDir/${username}

# 导出 kubeconfig，包含基本的集群参数 clusters
echo 'set-cluster  ....'
KUBE_APISERVER="https://kubernetes.docker.internal:6443"
kubectl config set-cluster ${cluster} \
	--kubeconfig=./$userDir/${username}.kubeconfig \
	--embed-certs=true \
	--certificate-authority=./$userDir/${username}.csr \
	--server=${KUBE_APISERVER}

# 设置客户端认证(users用户参数)
echo 'set-credentials  ....'
kubectl config set-credentials ${username} \
	--kubeconfig=./$userDir/${username}.kubeconfig \
	--embed-certs=true \
    --client-certificate=./$userDir/${username}.pem \
    --client-key=./$userDir/${username}-key.pem

# 设置上下文参数
echo 'set-context  ....'
kubectl config set-context ${username} \
	--kubeconfig=./$userDir/${username}.kubeconfig \
	--cluster=${cluster} \
	--namespace=${namespace} \
	--user=${username}

