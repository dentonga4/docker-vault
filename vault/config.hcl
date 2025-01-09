storage "raft" {
  path  = "/vault/data"
  node_id = "_NODE"
}

#storage "raft" {
#  path  = "/vault/data"
#  node_id = "node1"
#  retry_join 
#  {
#    leader_api_addr = "https://hcvault-a:8200"
#    leader_ca_cert_file = "/vault/vault.crt"
#    leader_client_cert_file = "/vault/vault.crt"
#    leader_client_key_file = "/vault/vault.key"
#  }
#  retry_join 
#  {
#    leader_api_addr = "https://hcvault-b:8200"
#    leader_ca_cert_file = "/vault/vault.crt"
#    leader_client_cert_file = "/vault/vault.crt"
#    leader_client_key_file = "/vault/vault.key"
#  }
#}

listener "tcp" {
  address   = "0.0.0.0:8200"
  tls_disable = "false"
  tls_cert_file = "/vault/vault.crt"
  tls_key_file  = "/vault/vault.key"
  tls_client_ca_file = "/vault/vault.crt"
}

api_addr = "http://0.0.0.0:8200"
cluster_addr = "https://127.0.0.1:8201"
ui = true
disable_mlock = true

