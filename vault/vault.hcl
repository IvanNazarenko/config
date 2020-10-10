listener "tcp" {
  address          = "vault1.my.domain:8200"
  cluster_address  = "vault1.my.domain:8201"
  tls_cert_file    = "/etc/vault.d/ssl/vault1-cert.pem"
  tls_key_file     = "/etc/vault.d/ssl/vault1-pk.pem"
}

storage "consul" {
 # address = "server.reno.mito:8501"
  address = "unix://etc/consul.d/consul_http.socket"
  path    = "vault/"
  token   = "7ja2k3s-291ms-lasnd216ef2"
#  scheme  = "https"
#  tls_ca_file   = "/etc/consul.d/ssl/full-chain.pem"
#  tls_cert_file = "/etc/consul.d/ssl/consul1-cert.pem"
#  tls_key_file  = "/etc/consul.d/ssl/consul1-pk.pem"
}

ui = true
api_addr = "https://vault1.my.domain:8200"
cluster_addr = "https://vault1.my.domain:8201"

