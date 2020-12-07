
#  shell module - run ansible module against localhost, no login prompt/not through SSH connection
ansible all -i "localhost," -c local -m shell -a 'echo hello world'

# ping module
ansible all -i "localhost," -c local -m ping

# enable debug for anisble command
 ANSIBLE_DEBUG=1 ansible all -i "localhost," -c local -m ping

# Use SSH connection, need to install sshpass (brew install http://git.io/sshpass.rb) to overcome the following error
# "to use the 'ssh' connection type with passwords, you must install the sshpass program"
ansible all -i "localhost," -u njiang3 -m ping -k

# Run setup module to connect variables on the hosts
ansible all -i "localhost," -c local -m setup -a 'filter=ansible_ssh_*'
ansible all -i "localhost," -c local -m setup -a 'filter=ansible_*_mb'
ansible all -i "localhost," -c local -m setup -a 'filter=ansible_env'

