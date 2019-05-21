#!/usr/bin/env bash

# Install if pyenv does not exist.
PARENT_DIR=$(dirname $0)/../node
/usr/bin/env bash $PARENT_DIR/install_yarn.sh

if ! [[ -x $(command -v yarn) ]]; then
    echo "Error: Could not found yarn command."
    exit 1
fi

# Install vue-cli.
echo "- Installing vue-cil .."
yarn global add vue-cli

echo "- Done installing vue-cil .."


