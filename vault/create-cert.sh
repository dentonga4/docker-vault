#!/bin/bash

key_file=vault.key
cert_file=vault.crt
common_name=localhost
subject_alt_names="DNS:hcvault-a,DNS:hcvault-b,IP:127.0.0.1"

openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 \
  -nodes -keyout $key_file -out $cert_file -subj "/CN=localhost" \
  -addext "subjectAltName=${subject_alt_names}"

printf "\nNOTIFY: certificates generated\n"

printf "\n==============\nSubject Alternative Names\n==============\n\n"
for i in $(openssl x509 -in $cert_file -noout -text | grep -A1 'Subject Alternative Name' | tail -n1 | tr -d ','); { echo $i | cut -f2 -d:; }

printf "\nNOTIFY: Replacing certificates\n"
mv $key_file ssl/
mv $cert_file ssl/