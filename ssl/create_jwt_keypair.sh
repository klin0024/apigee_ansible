#!/bin/bash

openssl genrsa -out jwt.key 2048
openssl rsa -pubout -in jwt.key -out jwt.crt
