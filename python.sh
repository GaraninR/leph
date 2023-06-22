#!/bin/bash

echo ""========== Python "=========="

echo 'alias python=python3' >> ~/.bashrc
echo 'alias pip=pip3' >> ~/.bashrc
echo 'alias python=python3' >> ~/.profile
echo 'alias pip=pip3' >> ~/.profile
apt install build-essential make libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev -y
curl https://pyenv.run | bash
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.profile
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.profile
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.profile
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$($PYENV_ROOT/bin/pyenv init -)"
$PYENV_ROOT/bin/pyenv install 3.10.11
$PYENV_ROOT/bin/pyenv global 3.10.11
curl -sSL https://install.python-poetry.org | python3 -
echo 'export PATH="/home/vagrant/.local/bin:$PATH"' >> ~/.bashrc
echo 'export PATH="/home/vagrant/.local/bin:$PATH"' >> ~/.profile