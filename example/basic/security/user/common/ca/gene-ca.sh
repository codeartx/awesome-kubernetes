#####
# ca根证书
#####

# 生成 CA 密钥
openssl genrsa -out ca-key.pem 4096

# 生成 CA 根证书
openssl req -new -x509 -days 1000 -key ca-key.pem -out ca.pem
