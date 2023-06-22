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

export DEBIAN_FRONTEND=noninteractive

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
"Additional VSCode Extentions" \
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
"Like LiveServer, GitGraph, ThunderClient..." \
)

statuses=("ON" "ON" "OFF" "OFF" "OFF" "OFF" "ON" "ON" "OFF" "OFF" "OFF" "OFF" "OFF")

number_of_items=${#items[@]}

dialog_rows=$(expr $number_of_items + 6)
dialog_columns=95

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
else
    generate_vscode_extentions_script=0
fi

# Docker
if [[ " ${user_answer[*]} " =~ " ${items[1]} " ]]; then
    Docker

    if (( $generate_vscode_extentions_script == 1 )); then
        echo "code --install-extension ms-azuretools.vscode-docker" >> $vs_code_extentions_installation_script
    fi
fi

# Kubernetes
if [[ " ${user_answer[*]} " =~ " ${items[2]} " ]]; then
    Kubernetes

    if (( $generate_vscode_extentions_script == 1 )); then
        echo "code --install-extension ms-azuretools.vscode-docker" >> $vs_code_extentions_installation_script
    fi
fi

# # AWS
[[ " ${user_answer[*]} " =~ " ${items[3]} " ]] && AWS

# # NFS
[[ " ${user_answer[*]} " =~ " ${items[4]} " ]] && NFS

# # PowerShell
[[ " ${user_answer[*]} " =~ " ${items[5]} " ]] && PowerShell

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


sudo apt autoremove -y

if [[ " ${user_answer[*]} " =~ " ${items[13]} " ]] ; then
    echo "code --install-extension 42Crunch.vscode-openapi" >> $vs_code_extentions_installation_script
    echo "code --install-extension batisteo.vscode-django" >> $vs_code_extentions_installation_script
    echo "code --install-extension cweijan.vscode-office" >> $vs_code_extentions_installation_script
    echo "code --install-extension donjayamanne.python-environment-manager" >> $vs_code_extentions_installation_script
    echo "code --install-extension donjayamanne.python-extension-pack" >> $vs_code_extentions_installation_script
    echo "code --install-extension formulahendry.docker-explorer" >> $vs_code_extentions_installation_script
    echo "code --install-extension GitHub.copilot" >> $vs_code_extentions_installation_script
    echo "code --install-extension github.vscode-github-actions" >> $vs_code_extentions_installation_script
    echo "code --install-extension GitHub.vscode-pull-request-github" >> $vs_code_extentions_installation_script
    echo "code --install-extension Gruntfuggly.todo-tree" >> $vs_code_extentions_installation_script
    echo "code --install-extension hashicorp.terraform" >> $vs_code_extentions_installation_script
    echo "code --install-extension henriiik.docker-linter" >> $vs_code_extentions_installation_script
    echo "code --install-extension humao.rest-client" >> $vs_code_extentions_installation_script
    echo "code --install-extension KevinRose.vsc-python-indent" >> $vs_code_extentions_installation_script
    echo "code --install-extension kreativ-software.csharpextensions" >> $vs_code_extentions_installation_script
    echo "code --install-extension magnobiet.docker-extension-pack" >> $vs_code_extentions_installation_script
    echo "code --install-extension mhutchie.git-graph" >> $vs_code_extentions_installation_script
    echo "code --install-extension ms-azuretools.vscode-docker" >> $vs_code_extentions_installation_script
    echo "code --install-extension ms-dotnettools.csdevkit" >> $vs_code_extentions_installation_script
    echo "code --install-extension ms-dotnettools.csharp" >> $vs_code_extentions_installation_script
    echo "code --install-extension ms-dotnettools.vscode-dotnet-runtime" >> $vs_code_extentions_installation_script
    echo "code --install-extension ms-dotnettools.vscodeintellicode-csharp" >> $vs_code_extentions_installation_script
    echo "code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools" >> $vs_code_extentions_installation_script
    echo "code --install-extension ms-python.python" >> $vs_code_extentions_installation_script
    echo "code --install-extension ms-python.vscode-pylance" >> $vs_code_extentions_installation_script
    echo "code --install-extension ms-vscode.powershell" >> $vs_code_extentions_installation_script
    echo "code --install-extension mutantdino.resourcemonitor" >> $vs_code_extentions_installation_script
    echo "code --install-extension njpwerner.autodocstring" >> $vs_code_extentions_installation_script
    echo "code --install-extension p1c2u.docker-compose" >> $vs_code_extentions_installation_script
    echo "code --install-extension rangav.vscode-thunder-client" >> $vs_code_extentions_installation_script
    echo "code --install-extension redhat.vscode-yaml" >> $vs_code_extentions_installation_script
    echo "code --install-extension ritwickdey.LiveServer" >> $vs_code_extentions_installation_script
    echo "code --install-extension VisualStudioExptTeam.intellicode-api-usage-examples" >> $vs_code_extentions_installation_script
    echo "code --install-extension VisualStudioExptTeam.vscodeintellicode" >> $vs_code_extentions_installation_script
    echo "code --install-extension wholroyd.jinja" >> $vs_code_extentions_installation_script
    echo "code --install-extension amazonwebservices.aws-toolkit-vscode" >> $vs_code_extentions_installation_script
    echo "code --install-extension hbenl.vscode-test-explorer" >> $vs_code_extentions_installation_script
    echo "code --install-extension littlefoxteam.vscode-python-test-adapter" >> $vs_code_extentions_installation_script
    echo "code --install-extension ms-vscode.test-adapter-converter" >> $vs_code_extentions_installation_script
fi

if [[ " ${user_answer[*]} " =~ " ${items[0]} " ]]; then
    chmod +x $vs_code_extentions_installation_script
fi

echo "========== Please reload you terminal session! =========="
