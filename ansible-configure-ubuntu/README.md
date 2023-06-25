# Installation:
 - sudo apt update
 - sudo apt -y install software-properties-common
 - sudo apt-add-repository ppa:ansible/ansible
 - sudo apt update
 - sudo apt install ansible

# Update Hosts:
 - vim hosts

# Validate and obtain information about your Ansible inventory
 - ansible-inventory -i hosts --list

# Test Ansible is able to conenct to all hosts
 - ansible all -i hosts -m ping

# Running ad hoc commands
- ansible all -i hosts -a uptime
- ansible all -i hosts -a "free -m"
- ansible all -i hosts -a "df -h"

# Running Playbook
- vim first_playbook.yml
- ansible-playbook -i hosts first_playbook.yml