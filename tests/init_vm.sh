#!/bin/bash

set -ex

source /vagrant/.ssh_env

apt update
apt upgrade -y

echo $SSH_KEY >> ~/.ssh/authorized_keys
