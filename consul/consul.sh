cd /usr/local/bin 
wget https://releases.hashicorp.com/consul/1.7.1/consul_1.7.1_linux_amd64.zip
sudo apt install unzip
unzip consul_1.7.1_linux_amd64.zip
sudo chown root:root consul
mv consul /usr/local/bin
consul --version
consul autocomplete-install
complete -C /usr/local/bin/consul consul
sudo useradd --system --home /etc/consul.d --shell /bin/false consul
sudo mkdir --parents /opt/consul
sudo chown --recursive consul:consul /opt/consul
sudo touch /etc/systemd/system/consul.service
sudo echo "[Unit]
Description="HashiCorp Consul - A service mesh solution"
Documentation=https://www.consul.io/
Requires=network-online.target
After=network-online.target
ConditionFileNotEmpty=/etc/consul.d/consul.hcl

[Service]
Type=notify
User=consul
Group=consul
ExecStart=/usr/local/bin/consul agent -config-dir=/etc/consul.d/
ExecReload=/usr/local/bin/consul reload
KillMode=process
Restart=on-failure
LimitNOFILE=65536

[Install]
WantedBy=multi-user.target">/etc/systemd/system/consul.service

sudo mkdir --parents /etc/consul.d
sudo touch /etc/consul.d/consul.hcl
sudo chown --recursive consul:consul /etc/consul.d
sudo chmod 640 /etc/consul.d/consul.hcl

