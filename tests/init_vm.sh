#!/bin/bash

set -ex

source /vagrant/.ssh_env

apt update

apt install ssh -y
echo -e "nameserver 8.8.8.8\nnameserver 1.1.1.1" | sudo tee /etc/resolv.conf

echo $SSH_KEY >> /home/vagrant/.ssh/authorized_keys
