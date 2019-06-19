#!/bin/bash
 useradd -M -s /bin/false prometheus
 useradd --no-create-home -s /bin/false node_exporter
 sudo mkdir /etc/prometheus
 sudo mkdir /var/lib/prometheus
 sudo chown prometheus:prometheus /var/lib/prometheus
 sudo chown prometheus:prometheus /etc/prometheus
 cd /tmp
 wget https://github.com/prometheus/prometheus/releases/download/v2.7.2/prometheus-2.7.2.linux-amd64.tar.gz
 tar xvf prometheus-2.7.2.linux-amd64.tar.gz
 cp prometheus-2.7.2.linux-amd64/prometheus  /usr/local/bin/
 cp prometheus-2.7.2.linux-amd64/promtool /usr/local/bin/
 sudo chown prometheus:prometheus /usr/local/bin/prometheus
 sudo chown prometheus:prometheus /usr/local/bin/promtool
 cp -r prometheus-2.7.2.linux-amd64/consoles /etc/prometheus
 cp -r prometheus-2.7.2.linux-amd64/console_libraries /etc/prometheus
 sudo chown -R prometheus:prometheus /etc/prometheus/
 sudo chown -R prometheus:prometheus /etc/prometheus/console_libraries
 cp prometheus-2.7.2.linux-amd64/prometheus.yml /etc/prometheus
 cd prometheus-2.7.2.linux-amd64
 cat prometheus.yml
 cd /etc/systemd/system
 vi prometheus.service
 sudo systemctl daemon-reload
 sudo systemctl start prometheus
 sudo systemctl enable prometheus
 sudo systemctl status prometheus
