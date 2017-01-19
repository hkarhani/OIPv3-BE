#!/bin/bash
set -x

REPO="OIPv3-BE"

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
git clone https://github.com/hkarhani/$REPO.git
cd $REPO
mkdir -p ~/.jupyter/
mv config/jupyter_notebook_config.py ~/.jupyter/jupyter_notebook_config.py
nohup jupyter notebook &

# Install jccp
docker pull hkarhani/jccp
docker run -d -p 8801:8888 hkarhani/jccp 



# clean up
apt-get clean
