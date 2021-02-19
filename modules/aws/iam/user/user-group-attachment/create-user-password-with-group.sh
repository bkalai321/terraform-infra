#! /bin/bash

if [ $# -eq 0 ]
then
  echo "Username needs to be passed as first argument"
  exit 0
fi

username=$1
groupname='pilot-developers'
password=$(openssl rand -base64 8)

aws iam create-user --user-name ${username} --tags "Key=Email,Value=${username}@ihies.com"
aws iam create-login-profile --user-name ${username} --password ${password} --password-reset-required

aws iam add-user-to-group --group-name ${groupname} --user-name ${username}

echo "username: ${username}"
echo "password: ${password}"

