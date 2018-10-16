#!/usr/bin/env bash

echo "Copy a new hosts file to /etc/ansible/hosts"
cp /root/ocp_advanced_deployment/hosts /etc/ansible/hosts

echo "Set the current GUID to generate the inventory"
GUID=`hostname|awk -F. '{print $2}'`
sed -i "s/68b2/$GUID/g" /etc/ansible/hosts
