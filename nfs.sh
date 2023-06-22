#!/bin/bash

echo ""========== NFS "=========="
export DEBIAN_FRONTEND=noninteractive
sudo apt install nfs-kernel-server nfs-common -y

number_of_nfs_volumes=30
nfs_dir_path="/home/vagrant/Storages"
dir_prefix="volume"

mkdir -p $nfs_dir_path

for (( i=1;i<=$number_of_nfs_volumes;++i ))
do
    if [ $i -lt 10 ]; then
        dirname="$nfs_dir_path/${dir_prefix}0${i}"
    else
        dirname="$nfs_dir_path/$dir_prefix$i"
    fi

    if [ ! -f "first_run" ]; then
        mkdir -p $dirname
        echo "$dirname *(rw,sync,fsid=0,crossmnt,no_subtree_check)" | sudo tee -a /etc/exports > /dev/null
    fi
    
done

sudo exportfs -ar