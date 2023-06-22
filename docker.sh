#!/bin/bash

echo "========== Docker =========="
export DEBIAN_FRONTEND=noninteractive
sudo apt -y install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu jammy stable" -y
sudo apt -y update
sudo apt-cache policy docker-ce 
sudo apt -y install docker-ce -y
sudo usermod -aG docker ${USER}
sudo apt -y install docker-compose
exec bash --login
