#!/bin/bash

#install jvm/java
sudo echo "127.0.0.1 $(cat /etc/hostname)" >> /etc/hosts
sudo apt-get -y update
sudo apt-get install -y wget curl parted
sudo apt-get install -y linux-image-extra linux-image-extra-virtual

sudo echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC9d5bArHJLmYxYJ6RnThInZUZxwovhOzoKfemxwimYlO8o5tKwZpD7q/D+y6JWRnh+bLRHftLa0NAPXAOqlXOT8dYEwvOaIOkM4Ptz5yLNcThtMSVBUV2Fu/chdriGrDmYwdm6LNZjabT/Pr5PX+JtgsmTRJsAPvNMvjmHZOltopFGPEqDdekZIk0Q8WzfuIRYRtu9HSNnOTBIy3TgJBl3nR9S8vxl6J8fGwgyvT2ZqCWyBSWxkgcRpcsANPfsCVtWknALtrpbIgSx+7Nf1dNIJ5dYteAXIPpsBZrV/iQTqIQMkWJ1RyWxGb4/q6kxnDKb6/e+9FQ0m7A5qm/KhbYP' >> /home/ubuntu/.ssh/authorized_keys
sudo echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCA3IZUTfW84IuonSmqISa94gjZEjADCu/sS3B6aNlqUdQVHP+ssb+4hwd+ddTZXcGeG3jHUF86WoGS9a5u3k5LYfpJwaKESbjU2j8zeWZZwpH7BHoD8Ki3u4RXfRbrJ6N9CO0NJA+8bif82MMy1AYwblIOTmk430FK6j2zfCvbKY7EFmOGEyebzCKU7R8WVFJ/JWE83GjhDzsW8yhtXvCdGDtYWr8YYTUYuw5krMcS+yXsYHjEASrJErEAUpln8eUnj/KGYfSasKT1L/6wST5RM9OjHlbUlzXJ43XAYwZxeFo+QM776NrTiViN2ckAFEutszxgGAyYSHOYCe4yNk5T' >> /home/ubuntu/.ssh/authorized_keys

sudo mkdir -p /var/lib/jenkins

# sudo parted /dev/xvdz -s mklabel gpt
# sudo parted -a opt /dev/xvdz -s mkpart primary ext4 0% 100%
# sudo mkfs.ext4 /dev/xvdz1
# sudo mount -t ext4 /dev/xvdz1 /var/lib/jenkins
# sudo sleep 30
# sudo df -h

sudo apt-get -y install python-pip
sudo apt-get -y install awscli

sudo unlink /etc/localtime
ln -s /usr/share/zoneinfo/America/Chicago /etc/localtime

sudo apt-get -y install openjdk-11-jre-headless openjdk-11-jdk openjdk-11-jdk-headless openjdk-11-jre

wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get -y install jenkins
sudo update-rc.d jenkins enable
sudo service jenkins stop

aws s3 ls s3://ihi-main-terraform-us-east-1/jenkins/s3backup/master/jenkins.tar.gz
rm -f /etc/default/jenkins
sudo aws s3 cp s3://ihi-main-terraform-us-east-1/jenkins/jenkins-config/jenkins /etc/default/

existsOrNot=$(echo $?)

if [[ "$existsOrNot" -eq "0" ]]; then
  aws s3 cp s3://ihi-main-terraform-us-east-1/jenkins/s3backup/master/jenkins.tar.gz /tmp/
  cd /tmp/
  tar -zxf jenkins.tar.gz 
  service jenkins stop
  rm -rf /var/lib/jenkins/*
  mv var/lib/jenkins/* /var/lib/jenkins/ 
  #rsync -ar --exclude 'var/lib/jenkins/.java' --progress --bwlimit=15M var/lib/jenkins/ /var/lib/jenkins/ 
  service jenkins start
fi

rm -rf /tmp/var
rm -f /tmp/jenkins.tar.gz
rm -rf /var/lib/jenkins/lost+found

sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get -y update
sudo apt-get -y install docker-ce

sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo docker-compose --version

sudo service jenkins restart

