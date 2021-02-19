#!/bin/bash

#install jvm/java
sudo apt-get -y update
sudo apt-get install -y wget curl
sudo apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual

sudo echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC9d5bArHJLmYxYJ6RnThInZUZxwovhOzoKfemxwimYlO8o5tKwZpD7q/D+y6JWRnh+bLRHftLa0NAPXAOqlXOT8dYEwvOaIOkM4Ptz5yLNcThtMSVBUV2Fu/chdriGrDmYwdm6LNZjabT/Pr5PX+JtgsmTRJsAPvNMvjmHZOltopFGPEqDdekZIk0Q8WzfuIRYRtu9HSNnOTBIy3TgJBl3nR9S8vxl6J8fGwgyvT2ZqCWyBSWxkgcRpcsANPfsCVtWknALtrpbIgSx+7Nf1dNIJ5dYteAXIPpsBZrV/iQTqIQMkWJ1RyWxGb4/q6kxnDKb6/e+9FQ0m7A5qm/KhbYP niteshpant@ihi-ny80.ihi-es-chi.local' >> /home/ubuntu/.ssh/authorized_keys