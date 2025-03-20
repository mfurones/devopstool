#!/bin/bash

echo "--- Install Ansible ---"
### https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html#installing-ansible-on-ubuntu

echo "--- Install dependencies ---"
apt install software-properties-common

echo "--- Add Ansible ppa ---"
add-apt-repository --yes --update ppa:ansible/ansible

echo "--- APT update ---"
apt update

echo "--- Install Ansible ---"
apt install -y ansible

echo "--- End Install Ansible ---"
