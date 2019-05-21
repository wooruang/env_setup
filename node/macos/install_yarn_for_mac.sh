#!/usr/bin/env bash

# Check if a command exists.
if [[ -x $(command -v yarn) ]]; then
    echo "Info: yarn is already installed."
    exit 1
fi

# Install yarn.
echo "Installing yarn ..."
brew install yarn
echo "Done installing yarn ..."
