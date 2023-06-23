#!/bin/bash

echo ""========== Kubernetes "=========="
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
wget https://get.helm.sh/helm-v3.11.0-rc.1-linux-amd64.tar.gz
tar -zxvf helm-v3.11.0-rc.1-linux-amd64.tar.gz
sudo mv linux-amd64/helm /usr/local/bin/helm

kubectl completion bash | sudo tee /etc/bash_completion.d/kubectl > /dev/null
echo 'alias k=kubectl' >>~/.bashrc
echo 'alias mk="minikube -p vagrant-mk"' >>~/.bashrc
echo 'alias k=kubectl' >>~/.profile
echo 'alias mk="minikube -p vagrant-mk"' >>~/.profile

minikube -p vagrant-mk start

rm helm*.tar.gz
rm minikube-linux-amd64
rm kubectl
rm -rf linux-amd64
