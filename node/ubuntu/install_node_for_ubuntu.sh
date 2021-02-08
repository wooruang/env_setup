#!/usr/bin/env bash

# Check if a command exists.
if [[ -x $(command -v node) ]]; then
    echo "Info: node is already installed."
    exit 1
fi

# Install node.
echo "Installing node ..."

UBUNTU_VER=`lsb_release -r | awk '{print $2}'`

echo "Ubuntu version: $UBUNTU_VER"

if [[ "$UBUNTU_VER" == "14.04" ]]; then
    curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
    sudo apt-get install -y nodejs
elif [[ "$UBUNTU_VER" == "18.04" ]]; then
    curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
    sudo apt-get install -y nodejs
elif [[ "$UBUNTU_VER" == "20.04" ]]; then
    curl -sL https://deb.nodesource.com/setup_15.x | sudo -E bash -
    sudo apt-get install -y nodejs
fi

echo "Done installing node ..."

