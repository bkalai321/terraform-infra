#!/bin/bash


apt-get -y install python-pip
pip install awscli

echo "cloning repo"

#checkout the repo
git clone git@bitbucket.org:smartenergystorage/es_pilot.git
cd es_pilot
#git checkout master
GIT_CHECKOUT_COMMAND

cd ihi-decs

export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
make clean
sudo make all
myDate=$(date '+%Y-%m-%d')

tar -czvf ../${myDate}pilot-VERSION_NUMBER-BUILD_NUMBER.tar.gz .
tar -czvf ../pilot-VERSION_NUMBER-BUILD_NUMBER.tar.gz .

aws s3 cp ${myDate}pilot-VERSION_NUMBER-BUILD_NUMBER.tar.gz s3://S3_BUCKET_NAME_VERSION_PATH/
aws s3 cp pilot-VERSION_NUMBER-BUILD_NUMBER.tar.gz s3://S3_BUCKET_NAME_PILOT_TAR_PATH/

aws s3 ls s3://S3_BUCKET_NAME_PILOT_TAR_PATH/
aws s3 ls s3://S3_BUCKET_NAME_VERSION_PATH/
