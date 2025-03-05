#!/bin/bash
sudo apt update
sudo apt install linux-image-4.15.0-46-generic \
                linux-headers-4.15.0-46-generic -y
sudo apt install linux-image-4.15.0-46-generic linux-modules-extra-4.15.0-46-generic
sudo update-grub

# # change the GRUB_DEFAULT in /etc/default/grub as
# ##    GRUB_DEFAULT="Advanced options for Ubuntu>Ubuntu, with Linux 4.15.0-46-generic"
# sudo vi /etc/default/grub

wget https://apt.llvm.org/llvm.sh
chmod +x llvm.sh
sudo ./llvm.sh 9

curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env
rustup default nightly-2022-02-04-x86_64-unknown-linux-gnu
rustup component add rust-src

rustup toolchain list

git clone https://github.com/SJTU-IPADS/krcore-artifacts --recursive
git checkout atc22-artifacts
cd krcore-artifacts/mlnx-ofed-4.9-driver
wget https://www.mellanox.com/downloads/ofed/MLNX_OFED-4.9-3.1.5.0/MLNX_OFED_LINUX-4.9-3.1.5.0-ubuntu18.04-x86_64.tgz
tar zxf MLNX_OFED_LINUX-4.9-3.1.5.0-ubuntu18.04-x86_64.tgz
cd MLNX_OFED_LINUX-4.9-3.1.5.0-ubuntu18.04-x86_64
# sudo ./mlnxofedinstall
# sudo /etc/init.d/openibd restart