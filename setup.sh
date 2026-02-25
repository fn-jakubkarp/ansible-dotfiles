#!/bin/bash

set -e

echo "Checking if Ansible is installed..."
if ! command -v ansible &> /dev/null; then
    echo "Ansible not found. Installing..."
    sudo apt update
    sudo apt install -y ansible
else
    echo "Ansible is already installed."
fi

echo "Running playbook with networking tag..."
ansible-playbook main.yml --tags networking -K

echo "Done!"