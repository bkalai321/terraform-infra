#!/bin/bash

cat >> /home/ubuntu/.ssh/authorized_keys << EOF
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC9d5bArHJLmYxYJ6RnThInZUZxwovhOzoKfemxwimYlO8o5tKwZpD7q/D+y6JWRnh+bLRHftLa0NAPXAOqlXOT8dYEwvOaIOkM4Ptz5yLNcThtMSVBUV2Fu/chdriGrDmYwdm6LNZjabT/Pr5PX+JtgsmTRJsAPvNMvjmHZOltopFGPEqDdekZIk0Q8WzfuIRYRtu9HSNnOTBIy3TgJBl3nR9S8vxl6J8fGwgyvT2ZqCWyBSWxkgcRpcsANPfsCVtWknALtrpbIgSx+7Nf1dNIJ5dYteAXIPpsBZrV/iQTqIQMkWJ1RyWxGb4/q6kxnDKb6/e+9FQ0m7A5qm/KhbYP
EOF

chmod 600 /home/ubuntu/.ssh/authorized_keys
chown -R ubuntu.ubuntu /home/ubuntu/.ssh/authorized_keys

perl -pi -e "s/2200/22/g" /etc/ssh/sshd_config

sudo /etc/init.d/ssh restart
crontab -r

sudo apt-get update -y

sleep 60


