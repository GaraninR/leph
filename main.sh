#!/bin/bash

function Init() {
    ./init.sh
}

function Docker() {
    ./docker.sh
}

function Kubernetes() {
    ./kubernetes.sh
}

function AWS() {
    ./aws.sh
}

function NFS() {
    ./nfs.sh
}

function PowerShell() {
    ./powershell.sh
}

function Terraform() {
    ./terraform.sh
}

function PythonEnv() {
    ./python.sh
}

function MSDotnet() {
    ./dotnet.sh
}

function Java() {
    ./java.sh
}

function NodeJS() {
    ./nodejs.sh
}

function ArgoCD() {
    ./argocd.sh
}

function Linuxbrew() {
    ./linuxbrew.sh
}

dialog_title="Linux environment helper"
description_title="Select items for installation"
vs_code_extentions_installation_script="vscode_install_extensions.sh"

rm $vs_code_extentions_installation_script

items=(\
"Visual Studio Code Plugins Script" \
"Docker" \
"Minikube/Kubectl/Helm/Autocomplete" \
"AWS Tools" \
"NFS Server and Storages for K8s" \
"PowerShell" \
"Terraform" \
"Python/PyEnv/Poetry/Aliases" \
"Dotnet/C#" \
"Jabba/Java" \
"NVM/NodeJS" \
"ArgoCD" \
"Linuxbrew" \
)

descriptions=(\
"Generate script for VSCode plugins" \
"Docker/Docker compose" \
"Kubernetes infrastructure" \
"Tools for communicating with AWS" \
"NFS Server and directories for K8s storaging" \
"PowerShell Linux Support" \
"Terraform" \
"Python and infrastructure" \
".NET/C# infrastructure" \
"Java over Jabba" \
"NodeJS over NVM" \
"GitOps for Kubernetes" \
"Brew for Linux" \
)

statuses=("ON" "ON" "OFF" "OFF" "OFF" "OFF" "ON" "ON" "OFF" "OFF" "OFF" "OFF" "OFF")

number_of_items=${#items[@]}

dialog_rows=$(expr $number_of_items + 6)
dialog_columns=90

declare -a args=()
for ((i=0;i<=number_of_items-1;i++)); do 
    args+=("${items[$i]}" "${descriptions[$i]}" "${statuses[$i]}")
done

eval user_answer=( $(whiptail --ok-button "Install" --title "$dialog_title" --checklist \
"$description_title" $dialog_rows $dialog_columns $number_of_items "${args[@]}" 3>&1 1>&2 2>&3) )

if [ -z "$user_answer" ]; then
    echo "Cancelled"
    exit 0
fi

Init

generate_vscode_extentions_script=0
if [[ " ${user_answer[*]} " =~ " ${items[0]} " ]]; then
    generate_vscode_extentions_script=1

    echo "code --install-extension ms-vscode-remote.remote-ssh" >> $vs_code_extentions_installation_script
    echo "code --install-extension ms-vscode-remote.remote-ssh-edit" >> $vs_code_extentions_installation_script
else
    generate_vscode_extentions_script=0
fi

# Docker
if [[ " ${user_answer[*]} " =~ " ${items[1]} " ]]; then
    Docker

    if (( $generate_vscode_extentions_script == 1 )); then
        echo "code --install-extension ms-vscode-remote.remote-containers" >> $vs_code_extentions_installation_script
        echo "code --install-extension ms-azuretools.vscode-docker" >> $vs_code_extentions_installation_script
    fi
fi

[[ " ${user_answer[*]} " =~ " ${items[1]} " ]] && Kubernetes

# # 2. VSCode
# # snap install code --classic
# curl -Lk 'https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64' --output vscode_cli.tar.gz

# tar -xf vscode_cli.tar.gz
# # 3. VSCode Plugins
# code --install-extension ms-azuretools.vscode-docker
# # 4. Docker
# apt -y install apt-transport-https ca-certificates curl software-properties-common && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu jammy stable" -y && sudo apt -y update && apt-cache policy docker-ce && sudo apt -y install docker-ce -y && sudo usermod -aG docker ${USER} && sudo apt -y install docker-compose

# code --install-extension ms-vscode-remote.remote-ssh 
# code --install-extension ms-vscode-remote.remote-ssh-edit 
# code --install-extension ms-vscode-remote.remote-containers 

# Docker: 
# code --install-extension ms-azuretools.vscode-docker 

# # 5. Kubernetes
# curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
# install minikube-linux-amd64 /usr/local/bin/minikube
# curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
# install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
# wget https://get.helm.sh/helm-v3.11.0-rc.1-linux-amd64.tar.gz
# tar -zxvf helm-v3.11.0-rc.1-linux-amd64.tar.gz
# mv linux-amd64/helm /usr/local/bin/helm

# kubectl completion bash | sudo tee /etc/bash_completion.d/kubectl > /dev/null
# echo 'alias k=kubectl' >>~/.bashrc
# echo 'alias mk=minikube' >>~/.bashrc
# echo 'alias k=kubectl' >>~/.profile
# echo 'alias mk=minikube' >>~/.profile

# minikube start -p vagrant-minikube
# # NFS
# apt install nfs-kernel-server nfs-common -y

# # PowerShell
# wget -q "https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb"
# dpkg -i packages-microsoft-prod.deb
# rm packages-microsoft-prod.deb
# apt update
# apt install -y powershell

# # Python
# echo 'alias python=python3' >> ~/.bashrc
# echo 'alias pip=pip3' >> ~/.bashrc
# echo 'alias python=python3' >> ~/.profile
# echo 'alias pip=pip3' >> ~/.profile
# apt install build-essential make libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev -y
# curl https://pyenv.run | bash
# echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
# echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.profile
# echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
# echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.profile
# echo 'eval "$(pyenv init -)"' >> ~/.bashrc
# echo 'eval "$(pyenv init -)"' >> ~/.profile
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
# # error
# pyenv install 3.10.11
# pyenv global 3.10.11
# curl -sSL https://install.python-poetry.org | python3 -
# echo 'export PATH="/home/vagrant/.local/bin:$PATH"' >> ~/.bashrc
# echo 'export PATH="/home/vagrant/.local/bin:$PATH"' >> ~/.profile
