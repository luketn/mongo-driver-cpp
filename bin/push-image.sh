#! /bin/bash

docker build -f ${1-${DOCKER_FILE}} --tag mongo-driver-cpp `dirname ${1-$DOCKER_FILE}}`

echo "TODO: push to docker"
