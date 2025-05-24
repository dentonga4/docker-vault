#!/bin/bash
sed -i -e "s/_NODE/${hcvnode}/g" /vault/config.hcl
vault server -config /vault/config.hcl
