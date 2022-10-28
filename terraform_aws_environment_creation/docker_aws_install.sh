#!/bin/bash
# sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done
#install docker
apt-get update -y
sudo snap install docker
#install unzip
sudo apt install unzip
#install awssli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
sudo chmod 666 /var/run/docker.sock
sudo docker run --name nginx -d  nginx:1.23.2-alpine
