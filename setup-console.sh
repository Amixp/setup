#!/bin/bash
#setup-console.sh
apt update
apt install net-tools nano vim  vim-addon-manager vim-haproxy vim-icinga2 vim-puppet vim-gtk3 vim-scripts vim-syntastic vim-tabular vim-youcompleteme -y
apt install ansible git -y

apt install apt-transport-https ca-certificates  curl gnupg lsb-release -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  focal stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io -y
systemctl enable docker
service docker start

apt install libz-dev libssl-dev libcurl4-gnutls-dev libexpat1-dev gettext cmake gcc -y
apt install python3-pip -y

#git config --global user.name "Your Name"
#git config --global user.email "youremail@domain.com"
apt update
apt upgrade -y
