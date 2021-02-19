#!/bin/bash

apt-get -y update

apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

apt-get -y update
apt-get install -y python
apt-get -y install python-pip
pip install awscli
apt-get -y install docker-ce

curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose --version

mkdir -p /home/npant/.ssh /home/sjensen/.ssh

useradd -d /home/npant npant
useradd -d /home/sjensen sjensen

cat > /home/npant/.ssh/authorized_keys <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC9d5bArHJLmYxYJ6RnThInZUZxwovhOzoKfemxwimYlO8o5tKwZpD7q/D+y6JWRnh+bLRHftLa0NAPXAOqlXOT8dYEwvOaIOkM4Ptz5yLNcThtMSVBUV2Fu/chdriGrDmYwdm6LNZjabT/Pr5PX+JtgsmTRJsAPvNMvjmHZOltopFGPEqDdekZIk0Q8WzfuIRYRtu9HSNnOTBIy3TgJBl3nR9S8vxl6J8fGwgyvT2ZqCWyBSWxkgcRpcsANPfsCVtWknALtrpbIgSx+7Nf1dNIJ5dYteAXIPpsBZrV/iQTqIQMkWJ1RyWxGb4/q6kxnDKb6/e+9FQ0m7A5qm/KhbYP niteshpant@ihi-ny80.ihi-es-chi.local
EOF
chmod 600 /home/npant/.ssh/authorized_keys
chown -R npant.npant /home/npant


cat > /home/sjensen/.ssh/authorized_keys <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC2AJBhDJ7T//2MayrnSJWdKfqplNDmKv6a6CzF5ZNtRDpRCHEqYdTPcQJz6t9iJQctHwwuuT4YXdSgB9QOfQ6x7pVac4dYxmNUsQTHgeDp9BZTtr6rGwvvmItCOLYjy3Zuxc7fFreGFGZC+wWhunQdBFoVyTMUwDR/bGrZYfOyBEixCaaf9T9cCAOFBDL1pxebuW+CB4/c6QMFl6Urpc0dctTqAUYxhAbAsTjDDyQO1O9X3A3V0kvZ4BJwGyrbC5y9XW5jEo74kJx6gJTSlwA+kMO6jbv2ReIqkZRsbNcHEeJ38xtCA5O7/UHtSWQU4rdGfM0mS7Nb00L5b5AZ8OLr sjensen@mbp-sjensen.local
EOF
chmod 600 /home/sjensen/.ssh/authorized_keys
chown -R sjensen.sjensen /home/sjensen

usermod -g sudo npant
usermod -g sudo sjensen



