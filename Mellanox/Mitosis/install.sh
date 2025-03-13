#!/bin/bash
sudo apt update && \
sudo apt install -y linux-image-4.15.0-46-generic linux-headers-4.15.0-46-generic linux-modules-extra-4.15.0-46-generic dpkg-dev && \
sudo sed -i "s/GRUB_DEFAULT=0/GRUB_DEFAULT=\"Advanced options for Ubuntu>Ubuntu, with Linux 4.15.0-46-generic\"/" /etc/default/grub && \
sudo update-grub && \
sudo reboot

# # change the GRUB_DEFAULT in /etc/default/grub as
# ##    GRUB_DEFAULT="Advanced options for Ubuntu>Ubuntu, with Linux 4.15.0-46-generic"
# sudo vi /etc/default/grub

wget https://releases.llvm.org/9.0.0/clang+llvm-9.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
tar -xvf clang+llvm-9.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
mv clang+llvm-9.0.0-x86_64-linux-gnu-ubuntu-18.04 clang-9

curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh && \
source $HOME/.cargo/env && \
rustup default nightly-2022-02-04-x86_64-unknown-linux-gnu && \
rustup component add rust-src

rustup toolchain list

wget https://www.mellanox.com/downloads/ofed/MLNX_OFED-4.9-3.1.5.0/MLNX_OFED_LINUX-4.9-3.1.5.0-ubuntu18.04-x86_64.tgz && \
wget https://www.mellanox.com/downloads/ofed/MLNX_OFED-4.9-3.1.5.0/MLNX_OFED_SRC-debian-4.9-3.1.5.0.tgz && \

tar zxf MLNX_OFED_LINUX-4.9-3.1.5.0-ubuntu18.04-x86_64.tgz && \
tar -zxvf MLNX_OFED_SRC-debian-4.9-3.1.5.0.tgz && \
git clone https://github.com/SJTU-IPADS/krcore-artifacts --recursive && \
# git checkout atc22-artifacts  && \
# cd krcore-artifacts/mlnx-ofed-4.9-driver && \
cd MLNX_OFED_LINUX-4.9-3.1.5.0-ubuntu18.04-x86_64 && \
sudo ./mlnxofedinstall && \
sudo /etc/init.d/openibd restart

cp MLNX_OFED_SRC-4.9-3.1.5.0/SOURCES/mlnx-ofed-kernel_4.9.orig.tar.gz ~/krcore-artifacts/mlnx-ofed-4.9-driver && \
cd ~/krcore-artifacts/mlnx-ofed-4.9-driver && \
tar -zxvf mlnx-ofed-kernel_4.9.orig.tar.gz && \
cd mlnx-ofed-kernel-4.9/ && \
cp -r ~/krcore-artifacts/mlnx-ofed-4.9-driver/drivers/* ./drivers/ && \
cp -r ~/krcore-artifacts/mlnx-ofed-4.9-driver/include/* ./include/


# remember to modify ~/.bashrc
vim ~/.bashrc
<<EOF
CLANG_HOME=~/clang-9
PATH=$CLANG_HOME/bin:$PATH

And comment these lines
case $- in
    *i*) ;;
      *) return;;
esac
EOF
