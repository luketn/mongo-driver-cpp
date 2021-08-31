FROM amazonlinux:2
RUN yum install -y tar clang cmake3 make gzip wget openssl-devel cyrus-sasl-devel git

WORKDIR /opt/mongo-c-driver
RUN wget https://github.com/mongodb/mongo-c-driver/releases/download/1.19.0/mongo-c-driver-1.19.0.tar.gz && \
    tar -xzf mongo-c-driver-1.19.0.tar.gz
WORKDIR /opt/mongo-c-driver/mongo-c-driver-1.19.0/cmake-build
RUN cmake3 -DENABLE_AUTOMATIC_INIT_AND_CLEANUP=OFF ..
RUN cmake3 --build .
RUN cmake3 --build . --target install

WORKDIR /opt/mongocpp
RUN curl -OL https://github.com/mongodb/mongo-cxx-driver/releases/download/r3.6.5/mongo-cxx-driver-r3.6.5.tar.gz
RUN tar -xzf mongo-cxx-driver-r3.6.5.tar.gz
WORKDIR	mongo-cxx-driver-r3.6.5/build
RUN cmake3 ..                                   \
        -DCMAKE_BUILD_TYPE=Release              \
        -DCMAKE_PREFIX_PATH="/opt/mongo-c-driver/mongo-c-driver-1.19.0" \
        -DCMAKE_INSTALL_PREFIX=/usr/local
RUN cmake3 --build .
RUN cmake3 --build . --target install