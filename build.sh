#!/bin/bash

echo $REPOSITORY_PASSWORD | docker login -u $REPOSITORY_USER $REPOSITORY_URL --password-stdin 

docker build -t $REPOSITORY_URL/$REPOSITORY_NAME/etcd:latest .
docker build -t $REPOSITORY_URL/$REPOSITORY_NAME/etcd:1.0.0 .