#!/bin/bash
apt-get -y update
echo "Sleeping for 45 seconds…"
sleep 45
echo "Completed"
sudo apt install -y ruby-full ruby-bundler build-essential
