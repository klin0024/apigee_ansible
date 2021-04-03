#!/bai/bash

day="24855"
domain="c.gcp-expert-sandbox-allen.internal"
subj="/C=TW/ST=Taipei/L=Taipei/O=google/OU=apigee/CN=*.${domain}"
pass="P@ssw0rd"
alias="apigee"

#touch /etc/pki/CA/index.txt
#touch /etc/pki/CA/serial
#echo "00" > /etc/pki/CA/serial

openssl genrsa -out ca.key 4096
openssl req -key ca.key -new -x509 -days $day -extensions v3_ca -out ca.crt -subj $subj 

openssl genrsa -out server.key
openssl req -key server.key -new -out server.csr -subj $subj -config openssl.cnf
openssl ca -extensions v3_req -days $day -in server.csr -out server.crt -cert ca.crt -keyfile ca.key

openssl pkcs12 -export -out server.p12 -in server.crt -inkey server.key -passout pass:${pass} -name $alias
keytool -importkeystore -srckeystore server.p12 -srcstoretype pkcs12 -srcstorepass $pass -srcalias $alias -destkeystore keystore.jks -deststoretype jks -deststorepass $pass -destalias $alias


openssl x509 -in server.crt -text -noout
keytool -list -v -storepass $pass -keystore keystore.jks
