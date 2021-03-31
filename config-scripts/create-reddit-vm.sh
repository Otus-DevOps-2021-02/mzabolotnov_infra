#!/bin/bash
# $1 - name Instance
# $2 - ID image for boot disk

if [[ -n "$1" || -n "$2" ]]
then
echo "instance-name $1 image $2"
else
echo "create-reddit-vm instance-name image-id. No parameters found."
exit 1
fi

yc compute instance create \
 --name $1 \
 --hostname $1 \
 --memory=2 \
 --create-boot-disk image-id=$2 \
 --network-interface subnet-name=default-ru-central1-b,nat-ip-version=ipv4 \
 --metadata serial-port-enable=1 \
 --ssh-key ~/.ssh/appuser.pub
 