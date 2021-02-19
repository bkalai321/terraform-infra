#!/bin/bash

#install jvm/java
sudo apt-get -y update
sudo apt-get install -y wget curl
sudo apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual