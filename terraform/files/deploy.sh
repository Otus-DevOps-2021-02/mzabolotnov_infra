#!/bin/bash
set -e
APP_DIR=${1:-$HOME}
sudo apt update -y
sleep 45
sudo apt install -y git
sleep 45
git clone -b monolith https://github.com/express42/reddit.git $APP_DIR/reddit
cd $APP_DIR/reddit
bundle install
sudo mv /tmp/puma.service /etc/systemd/system/puma.service
sudo systemctl start puma
sudo systemctl enable puma
