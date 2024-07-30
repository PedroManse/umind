read -e -p "private filename>" PRIV_NAME
read -e -p "public filename>" PUB_NAME

openssl genrsa -out "${PRIV_NAME%.pem}.pem" 2048
openssl rsa -in "${PRIV_NAME%.pem}.pem" -pubout -out "${PUB_NAME%.crt}.crt"
