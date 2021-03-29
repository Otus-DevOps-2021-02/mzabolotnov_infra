#!/bin/bash
sudo apt-get -y update
sudo apt-get -y install git
cd /home/yc-user
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
puma -d
