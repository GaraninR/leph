#!/bin/bash

chmod +x $PWD/*.sh
mkdir ~/Projects && mkdir ~/Infrastructure
export DEBIAN_FRONTEND=noninteractive
apt update -y && apt upgrade -y
apt install neovim git mc bash-completion curl \
    wget apt-transport-https software-properties-common -y
