#!/bin/bash
git clone https://github.com/tomcoh5/my-pipeline.git
cd my-pipeline
docker build -t $name .
if [ $? -eq 0 ]; then
	echo docker image built
else
	echo docker image failed to built,please try again
fi
