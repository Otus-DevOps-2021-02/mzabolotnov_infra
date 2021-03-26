#!/bin/bash
wget -qO - http://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
apt-get -y update
echo "Sleeping for 45 seconds…"
sleep 45
echo "Completed"
apt install -y ruby-full ruby-bundler build-essential mongodb-org
# sudo apt-get -y install mongodb-org
systemctl start mongod
systemctl enable mongod
