#!/bin/bash

echo "========== Dotnet =========="
export DEBIAN_FRONTEND=noninteractive
sudo apt-get update && \
  sudo apt-get install -y dotnet-sdk-7.0