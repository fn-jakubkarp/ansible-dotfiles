#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

set -euo pipefail

echo "Checking if Ansible is installed..."
if ! command -v ansible &> /dev/null; then
    echo "Ansible not found. Installing..."
    
    sudo apt update
    sudo apt install -y tzdata
    sudo apt install -y gnupg2 software-properties-common
    sudo add-apt-repository --yes --update ppa:ansible/ansible
    sudo apt install -y ansible
else
    echo "Ansible is already installed."
fi

echo "Running playbook..."
ansible-playbook main.yml -K