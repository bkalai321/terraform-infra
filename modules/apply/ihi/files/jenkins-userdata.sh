#!/bin/bash

#install jvm/java
sudo apt-get -y update
sudo apt-get install -y wget curl
sudo apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual


sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get -y update
sudo apt-get -y install docker-ce

sudo apt-get -y install python-pip
sudo pip install awscli
sudo docker run -d hello-world

sudo curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo docker-compose --version


#stop all the running containers
for i in $(sudo docker ps -a -q); do
  sudo docker stop $i
  sudo docker rm $i
done

mkdir -p dockers
cd dockers

aws s3 sync s3://ihi-main-us-west-1/jenkins/docker/ ./

ls -al 

sudo docker-compose up --build -d

for i in {10..50}; do
  echo $i

  http_code=$(curl -s -o /dev/null -w "%{http_code}" http://localhost)
  echo $http_code
  if [[ $http_code == '403' ]]; then
    break;
  else 
      sleep $i
  fi
done

sudo chmod 644 /var/lib/jenkins/secrets/initialAdminPassword
aws s3 cp /var/lib/jenkins/secrets/initialAdminPassword s3://ihi-main-us-west-1/jenkins/docker/

