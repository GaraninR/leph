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

# VSCode Plugins
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

# Kubernetes
[[ " ${user_answer[*]} " =~ " ${items[2]} " ]] && Kubernetes

# # 2. VSCode
# # snap install code --classic
# curl -Lk 'https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64' --output vscode_cli.tar.gz

# tar -xf vscode_cli.tar.gz

# # AWS
[[ " ${user_answer[*]} " =~ " ${items[3]} " ]] && AWS

# # NFS
[[ " ${user_answer[*]} " =~ " ${items[4]} " ]] && NFS
# apt install nfs-kernel-server nfs-common -y

# # PowerShell
[[ " ${user_answer[*]} " =~ " ${items[5]} " ]] && PowerShell
# wget -q "https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb"
# dpkg -i packages-microsoft-prod.deb
# rm packages-microsoft-prod.deb
# apt update
# apt install -y powershell

# Terraform
[[ " ${user_answer[*]} " =~ " ${items[6]} " ]] && Terraform

# PythonEnv
[[ " ${user_answer[*]} " =~ " ${items[7]} " ]] && PythonEnv

# MSDotnet
[[ " ${user_answer[*]} " =~ " ${items[8]} " ]] && MSDotnet

# Java
[[ " ${user_answer[*]} " =~ " ${items[9]} " ]] && Java

# NodeJS
[[ " ${user_answer[*]} " =~ " ${items[10]} " ]] && NodeJS

# ArgoCD
[[ " ${user_answer[*]} " =~ " ${items[11]} " ]] && ArgoCD

# Linuxbrew
[[ " ${user_answer[*]} " =~ " ${items[12]} " ]] && Linuxbrew

sudo apt autoremove