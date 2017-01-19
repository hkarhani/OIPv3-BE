#!/bin/bash
set -x

# create new ssh key
[[ ! -f /home/ubuntu/.ssh/mykey ]] \
&& mkdir -p /home/ubuntu/.ssh \
&& ssh-keygen -f /home/ubuntu/.ssh/mykey -N '' \
&& chown -R ubuntu:ubuntu /home/ubuntu/.ssh

# install packages
apt-get update
apt-get -y install docker.io ansible unzip

# add docker privileges
usermod -G docker ubuntu

# install pip
pip install -U pip && pip3 install -U pip
if [[ $? == 127 ]]; then
    wget -q https://bootstrap.pypa.io/get-pip.py
    python get-pip.py
    python3 get-pip.py
    rm get-pip.py
fi

# Install Jupyter Notebook
pip install jupyter
git clone https://github.com/hkarhani/OIPv3-BE.git




# clean up
apt-get clean
