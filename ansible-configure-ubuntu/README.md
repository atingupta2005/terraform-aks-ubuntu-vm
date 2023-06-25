# Installation:
 - sudo apt update
 - sudo apt -y install software-properties-common
 - sudo apt-add-repository ppa:ansible/ansible
 - sudo apt update
 - sudo apt install ansible

# Update Hosts:
 - vim hosts

# Validate and obtain information about your Ansible inventory
 - ansible-inventory -i hosts --list -k

# Test Ansible is able to conenct to all hosts
 - ansible all -i hosts -m ping -k

# Running ad hoc commands
- ansible all -i hosts -a uptime -k
- ansible all -i hosts -a "free -m" -kK
- ansible all -i hosts -a "df -h" -kK

# Running Playbook
- vim first_playbook.yml
- ansible-playbook -i hosts first_playbook.yml -kK

