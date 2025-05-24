# syntax=docker/dockerfile:1

ARG NODE=0
FROM redhat/ubi9:9.4-1181

# Execute Commands
RUN yum install -y yum-utils
RUN yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
RUN yum -y install vault-1.17.3-1.aarch64
RUN yum -y reinstall vault-1.17.3-1.aarch64
RUN mkdir -p /vault/data

# Set the working directory
WORKDIR /vault

# Copy local files
COPY config.hcl /vault
COPY service.sh /vault
COPY ssl/* /vault
COPY ssl/*.crt /etc/ssl/certs/
RUN chmod -R 755 /vault/*

# Launch Program
EXPOSE 8200
EXPOSE 8201
ENTRYPOINT ["/vault/service.sh"]
