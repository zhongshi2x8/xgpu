#!/bin/bash

# Update package list and install necessary packages

sudo apt update
sleep 5
echo "---------------------------"

sudo apt -y install ocl-icd-opencl-dev
sleep 5
echo "---------------------------"

sudo apt -y install nano
sleep 5
echo "---------------------------"

sudo apt -y install htop
sleep 5
echo "---------------------------"

# sudo apt -y install nvtop
sudo apt -y install cmake
sleep 5
echo "---------------------------"

sudo apt -y install python3-pip
sleep 5
echo "---------------------------"

# Clone the repository and build the project
git clone https://github.com/shanhaicoder/XENGPUMiner.git
sleep 5
echo "---------------------------"

cd XENGPUMiner
sleep 5
echo "---------------------------"

chmod +x build.sh
sleep 5
echo "---------------------------"

./build.sh
sleep 5
echo "---------------------------"

# Update the configuration file
sed -i 's/account = 0x10a537f4F71FbeA3D54AA1cF2fC2F99E5aAa1868/account = 0x10a537f4F71FbeA3D54AA1cF2fC2F99E5aAa1868/g' config.conf
sleep 5
echo "---------------------------"

# Install Python requirements
sudo pip install -U -r requirements.txt
sleep 5
echo "---------------------------"

sudo nohup python3 miner.py --gpu=true > miner.log 2>&1 &
sleep 5
echo "---------------------------"

sudo nohup ./xengpuminer > xengpuminer.log 2>&1 &
sleep 5
echo "---------------------------"
