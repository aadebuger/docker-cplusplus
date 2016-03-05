from ubuntu
run apt-get update
run apt-get -y install build-essential curl
run apt-get -y install libboost-dev libboost-test-dev libboost-program-options-dev libboost-system-dev libboost-filesystem-dev libevent-dev automake libtool flex bison pkg-config g++ libssl-dev
workdir /tmp
run apt-get -y install curl
run curl http://archive.apache.org/dist/thrift/0.9.3/thrift-0.9.3.tar.gz | tar zx
workdir /tmp/thrift-0.9.3
run ./configure  --without-python
run make
run make install
run apt-get -y install  libgoogle-glog-dev
run apt-get -y install git
workdir /home
run git clone https://github.com/redis/hiredis
workdir /home/hiredis
run make && make install
workdir /tmp
run apt-get -y install wget
run wget https://github.com/mongodb/mongo-c-driver/releases/download/1.1.10/mongo-c-driver-1.1.10.tar.gz
run tar -xzf mongo-c-driver-1.1.10.tar.gz
workdir /tmp/mongo-c-driver-1.1.10 
run ./configure --enable-ssl --enable-sas
run make -j8 && make install
run ldconfig 
workdir /tmp
run git clone -b legacy https://github.com/mongodb/mongo-cxx-driver.git
workdir /tmp/mongo-cxx-driver
run apt-get -y install scons
run apt-get -y install libboost-all-dev
run scons install --prefix=/usr/local
