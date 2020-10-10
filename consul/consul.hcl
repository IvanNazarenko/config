datacenter = "myDC"
data_dir = "/opt/consul"
encrypt = "LSmas221SD2-12A"
client_addr = "0.0.0.0"
bind_addr = "192.168.33.1"
domain = "mydomain"
retry_join = ["192.168.33.2","192.168.33.3","192.168.33.4","192.168.33.35"]
server = true
ui = true

addresses {
    http = "unix://etc/consul.d/consul_http.socket"
}

acl = {
  enabled = true
  default_policy = "deny"
  enable_token_persistence = true
  tokens = {
  agent =  "99t21nlsa-2ksm-9m82-0212b-99and021a"
    }
}

rejoin_after_leave = true
reconnect_timeout = "1m"

verify_incoming = false
verify_incoming_rpc = true
verify_outgoing = true
verify_server_hostname = true
auto_encrypt = {
  allow_tls = true
 }
ca_file = "/etc/consul.d/ssl/full-chain.pem"
cert_file = "/etc/consul.d/ssl/cert.pem"
key_file = "/etc/consul.d/ssl/pk.pem"
ports = {
# http = -1
 https = 8501
}


performance {
  raft_multiplier = 1
}


enable_syslog = true
log_json = true
log_file = "/etc/consul.d/"
log_rotate_duration = "24h"
log_rotate_max_files = -1
