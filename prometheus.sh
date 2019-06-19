#!/bin/bash
cd/
sudo mkdir prometheus
cd prometheus
wget https://github.com/prometheus/prometheus/releases/download/v2.10.0/prometheus-2.10.0.linux-amd64.tar.gz
tar -xzf prometheus-2.10.0.linux-amd64.tar.gz
cp /prometheus/prometheus-2.10.0.linux-amd64 /prometheus
sudo rm prometheus-2.10.0.linux-amd64/
sudo rm prometheus-2.10.0.linux-amd64.tar.gz
sudo rm prometheus.yml
cp /vagrant-share/prometheus/prometheus.yml prometheus.yml
./prometheus &>/dev/null &
cd ..
sudo mkdir node_exporter
cd node_exporter
wget https://github.com/prometheus/node_exporter/releases/download/v0.18.1/node_exporter-0.18.1.linux-amd64.tar.gz
tar -xzf node_exporter-0.18.1.linux-amd64.tar.gz
sudo rm node_exporter-0.18.1.linux-amd64.tar.gz
cp /node_exporter/node_exporter-0.18.1.linux-amd64 /node_exporter
sudo rm node_exporter-0.18.1.linux-amd64/
./node_exporter &>/dev/null &
cd ..
wget https://dl.grafana.com/oss/release/grafana-6.2.2.linux-amd64.tar.gz
tar -zxvf grafana-6.2.2.linux-amd64.tar.gz
cd grafana-6.2.2/
./bin/grafana-server &>/dev/null &
