#!/usr/bin/env bash

# Check if a command exists.
if [[ -x $(command -v yarn) ]]; then
    echo "Info: yarn is already installed."
    exit 1
fi

# Install yarn.
echo "Installing yarn ..."
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt update && sudo apt install yarn
echo "Done installing yarn ..."

