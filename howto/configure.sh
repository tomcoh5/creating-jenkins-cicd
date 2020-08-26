#!/bin/bash
cd $HOME
awsdir=".aws"
if [ ! -d $awsdir ]; then
	  mkdir $awsdir
fi
configfile=".aws/config"
if [ ! -f $configfile ];then
	touch $configfile
fi
chmod 777 .aws/config
echo "[profile eb-cli]" > .aws/config
echo "aws_access_key_id=$AWS_ACCESS_KEY_ID" >> .aws/config
echo "aws_secret_access_key=$AWS_SECRET_ACCESS_KEY" >> .aws/config
cd /var/jenkins_home/workspace/secondpipeline/my-pipeline/
ebdir=".elasticbeanstalk"
if [ ! -d $ebdir ]; then
	mkdir $ebdir
fi
ebconfig=".elasticbeanstalk/config.yml"
if [ ! -f $ebconfig ];then
	touch $ebconfig
fi
FILE=".elasticbeanstalk/config.yml"
/bin/cat << EOM >$FILE
branch-defaults:
  master:
    environment: $environment_name
global:
  aplication_name: $name
  default_ec2_keyname: $key_pair
  default_platform: 64bit Amazon Linux 2015.03 v1.4.3 running Ruby 2.2 (Puma)
  default_region: $region
  profile: eb-cli
  sc: git
EOM
