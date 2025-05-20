#!/bin/bash

echo "
██████╗ ██████╗  ██████╗      ██╗███████╗ ██████╗████████╗    ██████╗ 
██╔══██╗██╔══██╗██╔═══██╗     ██║██╔════╝██╔════╝╚══██╔══╝   ██╔════╝ 
██████╔╝██████╔╝██║   ██║     ██║█████╗  ██║        ██║      ██║█████╗
██╔═══╝ ██╔══██╗██║   ██║██   ██║██╔══╝  ██║        ██║      ██║   ██║
██║     ██║  ██║╚██████╔╝╚█████╔╝███████╗╚██████╗   ██║      ╚██████╔╝
╚═╝     ╚═╝  ╚═╝ ╚═════╝  ╚════╝ ╚══════╝ ╚═════╝   ╚═╝       ╚═════╝ 
"

echo "Welcome to Project 6 - Guacamole Demo Infrastructure Setup"
echo "This script will install and configure the complete infrastructure."
echo "Please make sure you have the following prerequisites:"
echo "- Ubuntu/Debian-based system"
echo "- Root or sudo access"
echo "- Internet connectivity"
echo ""
read -p "Do you want to continue? (y/n) " -n 1 -r
echo ""
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo "Installation cancelled."
    exit 1
fi

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