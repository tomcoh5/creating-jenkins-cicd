#!/bin/bash
cd /var/jenkins_home/workspace/secondpipeline/my-pipeline
ebdir="eb-env"
if [ ! -d $ebdir ];then
	mkdir $ebdir
fi
ebfile="eb-env/Dockerrun.aws.json"
if [ ! -f $ebfile ];then
	touch $ebfile
fi
FILE=eb-env/Dockerun.aws.json
/bin/cat <<EOM >$FILE
{
	"AWSEBDockerrunVersion": "1"
	"Image": {
	  "Name": "$user/$name",
	  "Update": "true

	},
	"Ports": [
	  {
		  "ContainerPort": "5000"
	  }
	]
      }
EOM
eb init -p docker $name
echo "creating environment for your app"
eb create $environment_name
echo "environment created"

