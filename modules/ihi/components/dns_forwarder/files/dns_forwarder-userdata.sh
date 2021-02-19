#!/bin/bash

sudo echo "127.0.0.1 $(cat /etc/hostname)" >> /etc/hosts
sudo apt-get -y update
sudo apt-get install -y wget curl 
sudo apt-get install -y bind9 bind9utils bind9-doc
sudo cat > /etc/bind/named.conf.options << END
acl "trusted" {
192.168.0.0/21;
10.40.0.0/16;
10.201.0.0/16;
localhost;
localnets;
};

options {
directory "/var/cache/bind";
recursion yes;
allow-query { trusted; };
forwarders {
10.201.0.2;
};
forward only;
dnssec-enable no;
dnssec-validation no;
dnssec-lookaside no;
auth-nxdomain no;
listen-on-v6 { any; };
};
END

# sudo apt-get -y install python-pip
# sudo pip install awscli
# sudo apt-get -y install network-manager ifupdown

# sudo aws ec2 attach-network-interface --device-index 1 --instance-id `wget -q -O - http://169.254.169.254/latest/meta-data/instance-id` --network-interface-id ${INTERFACE_ID}
sudo service bind9 restart


