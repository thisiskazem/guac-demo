# Guacamole Demo Infrastructure

This repository contains Ansible playbooks and roles for setting up a complete infrastructure demo environment using K3s, Apache Guacamole, KubeVirt, and VM management capabilities.

## Overview

The infrastructure consists of four main components:

1. **K3s (Lightweight Kubernetes)**
   - A lightweight Kubernetes distribution
   - Provides the base container orchestration platform
   - Includes kubectl configuration and bash completion

2. **Apache Guacamole**
   - Clientless remote desktop gateway
   - Supports various protocols (RDP, VNC, SSH)
   - Web-based interface for remote access

3. **KubeVirt**
   - Virtualization extension for Kubernetes
   - Enables running VMs alongside containers
   - Integrates VM management with Kubernetes

4. **VM Management**
   - Tools and configurations for VM lifecycle management
   - Integration with KubeVirt for VM operations

## Prerequisites

- Ubuntu/Debian-based system
- Root or sudo access
- Internet connectivity
- Ansible (will be installed automatically if not present)

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/thisiskazem/guac-demo
   cd guac-demo
   chmod +x install.sh
   ```

2. Run the installation script:
   ```bash
   sudo ./install.sh
   ```

The installation script will:
- Install Ansible if not present
- Execute the Ansible playbook with all required roles
- Set up the complete infrastructure

## Project Structure

```
.
├── install.sh           # Installation script
├── inventory.ini        # Ansible inventory file
├── playbook.yml         # Main Ansible playbook
└── roles/              # Ansible roles
    ├── group1_k3s/     # K3s installation and configuration
    ├── group2_guacamole/ # Apache Guacamole setup
    ├── group3_kubevirt/  # KubeVirt installation
    └── group4_vm/      # VM management configuration
```

## Usage

After installation, you can access:
- Kubernetes cluster using `kubectl` or `k` alias
- Guacamole web interface at `http://localhost:<port>`
- VM management through KubeVirt using `virtctl`

## Connecting to a VM using Guacamole

To connect to a VM using Guacamole, follow these steps:

1. Find the port for Guacamole loadbalancer:
   ```bash
   k get svc -n guacamole
   ```

2. Open your browser and navigate to:
   ```
   http://localhost:<port>/guacamole
   ```
   (Replace `<port>` with the port number you found in step 1)

3. Login with the following credentials:
   - Username: `guacadmin`
   - Password: `guacadmin`

4. Click on the user profile icon in the top right corner and select "Settings"

5. From the top tabs, select "Connections"

6. Click on "New Connection"

7. In the "EDIT CONNECTION" section:
   - Enter a name for your connection
   - Set Protocol to "RDP"
   - In the "PARAMETERS" section:
     - Under "Network":
       - Hostname: Enter the VM's IP address (get it using `k get vmi`)
       - Port: `3389`
     - Under "Authentication":
       - Username: `ubuntu`
       - Password: `ubuntu`

8. Click "Save" at the bottom of the page

9. Click on the user profile icon again and select "Home"

10. In the "ALL CONNECTIONS" section, click on your newly created connection to access the VM's GUI
