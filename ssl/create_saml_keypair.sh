#!/bin/bash

openssl genrsa -aes256 -out saml.key 1024
openssl rsa -in saml.key -out saml.key
openssl req -x509 -sha256 -new -key saml.key -out saml.csr
openssl x509 -sha256 -days 3650 -in saml.csr -signkey saml.key -out saml.crt
