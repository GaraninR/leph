#!/bin/bash

echo "========== Docker =========="
apt -y install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu jammy stable" -y
apt -y update
apt-cache policy docker-ce 
apt -y install docker-ce -y
usermod -aG docker ${USER}
apt -y install docker-compose