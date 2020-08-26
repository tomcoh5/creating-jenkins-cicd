#!/bin/bash
echo "pushing to repository"
docker login -u $user -p $pass
sleep 1
echo "logging has been successful"
sleep 2
docker tag $name $user/$name
docker push $user/$name
echo "image pushed successful"
