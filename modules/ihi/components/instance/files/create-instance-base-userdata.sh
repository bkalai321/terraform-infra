#!/bin/bash

apt-get -y update
apt-get -y install debconf-utils

echo 'libc6 libraries/restart-without-asking boolean true' | debconf-set-select

export DEBIAN_FRONTEND=noninteractive 
apt-get -y -qq install python-pip python3 python
pip install awscli

apt-get install -y ansible

##making sure that ssh port is 22

perl -pi -e "s/ 2200/ 22/g" /etc/ssh/sshd_config

#by default ihies-east-1 keys is always added via terraform.
#nitesh private keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC9d5bArHJLmYxYJ6RnThInZUZxwovhOzoKfemxwimYlO8o5tKwZpD7q/D+y6JWRnh+bLRHftLa0NAPXAOqlXOT8dYEwvOaIOkM4Ptz5yLNcThtMSVBUV2Fu/chdriGrDmYwdm6LNZjabT/Pr5PX+JtgsmTRJsAPvNMvjmHZOltopFGPEqDdekZIk0Q8WzfuIRYRtu9HSNnOTBIy3TgJBl3nR9S8vxl6J8fGwgyvT2ZqCWyBSWxkgcRpcsANPfsCVtWknALtrpbIgSx+7Nf1dNIJ5dYteAXIPpsBZrV/iQTqIQMkWJ1RyWxGb4/q6kxnDKb6/e+9FQ0m7A5qm/KhbYP" >> /home/ubuntu/.ssh/authorized_keys
#service jenkins keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC5Imj8+dceE8TSogP12OS2BkRQwI9CnZG+6NF+S1kuenPCkNv/HJ8DJ09NAahiXf/jlHjXt1bEJV+DKMZPRxbcba+XVWtCYvFxi6sS9il/6NUj28V9JWoD3xrgPk59S3GNMOWbeWeLJtHbpAq+h7Bmj26t8Jq1x0rrTHOBo7W5RRDky7rW0OgvaYin1AugQlZbSjVoXl+7oJcilIf7Lv4Pl5F5wFM89q9ymRriIHydzu+vSVVfwDjSl5v1kUneYF5ehKhLqAXv81yRZ+ept8RSi3g4fg/WQGMdikFaSL2wPXOZm8ZOfgtiQN4t/ph+VIN14Ee77NqFOVCTOPSrI11X" >> /home/ubuntu/.ssh/authorized_keys