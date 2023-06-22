#!/bin/bash

chmod +x $PWD/*.sh
export DEBIAN_FRONTEND=noninteractive
sudo apt update -y && apt upgrade -y
sudo apt install neovim git mc bash-completion curl \
    wget apt-transport-https software-properties-common -y

if [ ! -f "first_run" ]; then
    touch 'first_run'
    mkdir ~/Projects && mkdir ~/Infrastructure
    echo 'alias vim=nvim' >>~/.bashrc
    echo 'alias vim=nvim' >>~/.profile
fi

