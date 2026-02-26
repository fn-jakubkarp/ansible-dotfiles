#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

set -e

echo "Checking if Ansible is installed..."
if ! command -v ansible &> /dev/null; then
    echo "Ansible not found. Installing..."
    
    apt update
    apt install -y tzdata
    
    apt install -y gnupg2 software-properties-common
    add-apt-repository --yes --update ppa:ansible/ansible
    apt install -y ansible
else
    echo "Ansible is already installed."
fi

echo "Running playbook..."
ansible-playbook main.yml -K
