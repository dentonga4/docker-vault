#!/bin/bash

yum install -y yum-utils
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
yum -y install vault-1.17.3-1.aarch64
yum -y reinstall vault-1.17.3-1.aarch64
mkdir -p ./vault/data

# Start vault
vault server -config ./vault/config.hcl

# Export values
export VAULT_ADDR='https://0.0.0.0:8201'
export VAULT_SKIP_VERIFY='true'


