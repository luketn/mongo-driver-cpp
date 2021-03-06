#!/bin/bash
set -euo pipefail

echo "Testing docker build for Version: "$2", Package: "$3", Platform: "$4

# 1. Fetch and setup test framework.
# For more info and usage examples, see:
#   https://github.com/GoogleContainerTools/container-structure-test

# only linux and osx are supported
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  cst_ostype="linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  cst_ostype="darwin"
else
  echo "Unsupported operating system[$OSTYPE]"
  exit 1
fi
mkdir -p build/tool
wget -N \
     -P build/tool \
      https://storage.googleapis.com/container-structure-test/latest/container-structure-test-${cst_ostype}-amd64
chmod +x build/tool/container-structure-test-${cst_ostype}-amd64

# 2. Build the docker image.
# You can set $1 to a Dockerfile to test interractively
docker build -f ${1-${DOCKER_FILE}} --tag mongo-driver-cpp `dirname ${1-$DOCKER_FILE}}`

version=$(echo ${1-${DOCKER_FILE}} | rev | cut -d'/' -f4 | rev)

# 3. Test using container-structure-test.
build/tool/container-structure-test-${cst_ostype}-amd64 test \
    --image mongo-driver-cpp \
    --config test/test-image-${version}.yaml
