# #!/bin/bash

# set -e

# echo "Checking if Ansible is installed..."
# if ! command -v ansible &> /dev/null; then
#     echo "Ansible not found. Installing..."
#     sudo apt update
#     sudo apt install -y ansible
# else
#     echo "Ansible is already installed."
# fi

# echo "Running playbook with networking tag..."
# ansible-playbook main.yml --tags networking -K

# echo "Done!"

#!/bin/bash

set -e

echo "Checking if Ansible is installed..."
if ! command -v ansible &> /dev/null; then
    echo "Ansible not found. Installing..."
    
    apt update

    apt install -y gnupg2 software-properties-common
    
    add-apt-repository --yes --update ppa:ansible/ansible
    
    apt install -y ansible
else
    echo "Ansible is already installed."
fi

echo "Running playbook..."
ansible-playbook main.yml

echo "Done!"