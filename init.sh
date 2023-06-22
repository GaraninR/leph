#!/bin/bash

chmod +x $PWD/*.sh
mkdir ~/Projects && mkdir ~/Infrastructure
export DEBIAN_FRONTEND=noninteractive
sudo apt update -y && apt upgrade -y
sudo apt install neovim git mc bash-completion curl \
    wget apt-transport-https software-properties-common -y
