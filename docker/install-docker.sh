#!/usr/bin/env bash


# Uninstall old versions.
# sudo apt-get remove docker docker-engine docker.io containderd runc


# Set up the repository.
echo "=> Set up the repository."

# Step 1.
sudo apt-get update
sudo apt-get install -y \
	apt-transport-https \
	ca-certificates \
	curl \
	gnupg-agent \
	software-properties-common

# Step 2.
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

# Setp 3.
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"


# Install Docker engine.
echo "=> Install Docker engine."

# Step 1.
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Step 2.
apt-cache madison docker-ce

read -p "Select Docker Version string > " VERSION_STRING

sudo apt-get install -y docker-ce=$VERSION_STRING docker-ce-cli=$VERSION_STRING containerd.io

# Step 3.

echo "Test docker."
sudo docker run hello-world

