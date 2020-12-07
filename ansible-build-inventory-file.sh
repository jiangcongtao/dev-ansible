#!/usr/bin/env bash

set -x

# Note: Use here doc to assign multi-line string to a bash shell variable
#   1. Must use double quote to keep new line between multi-line string
inventory_ini="$(cat <<-EOF
mail.example.com

[webservers]
foo.example.com
barweb&db.example.com

[dbservers]
one.example.com
two.example.com
three.example.com
barweb&db.example.com


EOF
)"

# Must use double quote to keep new line 
echo "${inventory_ini}" > .hosts

# Exercise multiple hosts selection patterns

# All hosts: all or *
ansible all -i ./.hosts --list-hosts
ansible '*' -i ./.hosts --list-hosts
# or 
ansible \* -i ./.hosts --list-hosts

# only one group: dbservers
ansible dbservers -i ./.hosts --list-hosts

# multiple groups: webservers:dbservers
ansible webservers:dbservers -i ./.hosts --list-hosts

# excluding groups: webservers:!dbservers
ansible webservers:!dbservers -i ./.hosts --list-hosts

# intersection of groups: webservers:&dbservers
ansible 'webservers:&dbservers' -i ./.hosts --list-hosts

# One host: mail.example.com
ansible mail.example.com -i ./.hosts --list-hosts

# Multiple hosts: mail.example.com:foo.example.com
ansible mail.example.com:foo.example.com -i ./.hosts --list-hosts

# Multiple hosts: mail.example.com,foo.example.com
ansible mail.example.com,foo.example.com -i ./.hosts --list-hosts

rm .hosts