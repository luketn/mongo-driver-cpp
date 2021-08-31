docker build --platform linux/amd64 -t mongodb-linux-driver -f mongodb-driver-aws-linux2.Dockerfile .
#docker create -ti --name build-the-driver mongodb-linux-driver /bin/bash
#mkdir -p bin
#docker cp build-the-driver:/app/main ./bootstrap
#docker rm -f build-the-driver
#rm -f bootstrap.zip
#zip bootstrap bootstrap