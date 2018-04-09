#!/bin/bash
# run this script with sudo ./dockerize.sh 

# install git, docker and docker-compose 
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https:/download.docker.com/linux/ubuntu xenial stable"
apt update -y
apt install -y docker-ce python-pip git
pip install --upgrade pip
pip install setuptools
pip install docker-compose
usermod -aG docker $USER

# set up DNS and reload DNS settings
bash -c 'echo "nameserver 172.17.0.1" >> /etc/resolvconf/resolv.conf.d/head'
systemctl restart resolvconf.service



