#!/bin/bash

# Ensure script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit
fi

# Install Ansible if not present
if ! command -v ansible &> /dev/null; then
  apt update
  apt install -y ansible
fi

# Run the playbook
ansible-playbook -i inventory.ini playbook.yml