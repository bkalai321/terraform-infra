#! /bin/bash

if [ $# -eq 0 ]
then
  echo "Username needs to be passed as first argument"
  exit 0
fi

username=$1
groupname='pilot-developers'
password=$(openssl rand -base64 8)


aws iam remove-user-from-group --group-name ${groupname} --user-name ${username}
aws iam create-login-profile --user-name ${username} --password ${password}


