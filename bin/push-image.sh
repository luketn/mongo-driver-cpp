#! /bin/bash

docker build -f ${1-${DOCKER_FILE}} --tag mongo-driver-cpp `dirname ${1-$DOCKER_FILE}}`

echo "TODO: Push to DockerHub Version: "$2", Package: "$3", Platform: "$4
