#!/bin/bash

echo "========== Java =========="
wget https://github.com/shyiko/jabba/releases/download/0.11.2/jabba-0.11.2-linux-amd64
sudo install jabba-0.11.2-linux-amd64 /usr/local/bin/jabba
rm jabba-0.11.2-linux-amd64
jabba install adopt@1.11.0-11
echo 'export JAVA_HOME=/home/vagrant/.jabba/jdk/adopt@1.11.0-11' >>~/.bashrc
echo 'export JAVA_HOME=/home/vagrant/.jabba/jdk/adopt@1.11.0-11' >>~/.profile
echo 'export PATH=$JAVA_HOME/bin:$PATH' >>~/.bashrc
echo 'export PATH=$JAVA_HOME/bin:$PATH' >>~/.profile
