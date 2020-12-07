workon hcs-ansible

ansible --version

# check doc for a ping module
ansible-doc ping

# see available plugin
ansible-doc -l 

# Enable debug
ansible --list-hosts
ansible-playbook --list-hosts
ansible-playbook --list-tags
ansible-playbook --list-tasks
ansible-playbook --syntax-check