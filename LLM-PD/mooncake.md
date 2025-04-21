```bash
apt-get install -y build-essential \
               cmake \
               libibverbs-dev \
               libgoogle-glog-dev \
               libgtest-dev \
               libjsoncpp-dev \
               libnuma-dev \
               libcurl4-openssl-dev \
               libhiredis-dev

cd ~ && \
git clone https://gitcode.com/gh_mirrors/et/etcd-cpp-apiv3.git && \
cd etcd-cpp-apiv3 && \
apt-get install -y libboost-all-dev libssl-dev \
        libgrpc-dev \
        libgrpc++-dev \
        libprotobuf-dev \
        protobuf-compiler-grpc \
        libcpprest-dev && \
mkdir build && cd build && cmake .. && make


cd ~ && \
git clone https://gitee.com/alibaba/yalantinglibs.git && \
cd yalantinglibs && \
mkdir build && cd build && \
cmake .. -DBUILD_EXAMPLES=OFF -DBUILD_BENCHMARK=OFF -DBUILD_UNIT_TESTS=OFF && \
make -j$(nproc) && \
make install

cd ~ && \
git clone https://gitee.com/mirrors/mooncake.git && \

cd ~ && \
git clone https://gitee.com/mirros/vllm.git
```
