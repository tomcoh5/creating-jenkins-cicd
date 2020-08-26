# Welcome to my Jenkins Pipeline
CICD for flask web app to deployment in aws with elasticbeanstalk
## NOTES
make sure your ec2 secruity group inbould rules is opened to port 5000 , 50000 , 8080
have account on aws 
have account on dockerhub
## Installation
1. first step is installing docker by:
```bash
curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh
```
2.then building the docker image
```bash
docker build -t name-for-image .
```
3. run the jenkins-docker image
```bash
docker run -d -p 8080:8080 -p 50000:50000 -v /var/run/docker.sock:/var/run/docker.sock name-for-image
```
4.now go in to the browser and configure jenkins , create pipeline and copy paste the jenkinsfile

5.make sure to enter the following things credentials :
