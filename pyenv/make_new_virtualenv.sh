#!/usr/bin/env bash

PY_VER=$1
PY_ENV=$2

# Check a number of arguments.
if [[ $# -lt 2 ]]
then
    echo "Usage: $0 {PYTHON VERION} {VIRTUALENV_NAME}"
    exit 1
fi

# Install if python does not exist.
PARENT_DIR=$(dirname $0)
/usr/bin/env bash $PARENT_DIR/install_python.sh $PY_VER

# Make new virtualenv.
SUPPORTED=0
echo "- Making new virtualenv $PY_ENV($PY_VER) ..."
pyenv virtualenv $PY_VER $PY_ENV

if [[ $? -ne 0 ]]; then
    echo "WARNING: Alreay exist a env of $PY_ENV($PY_VER) Or Fail making new virtualenv $PY_ENV($PY_VER)."
    exit 1
fi

eval "$(pyenv init -)"
pyenv shell $PY_ENV
pip install --upgrade pip setuptools

echo "- Done making new virtualenv $PY_ENV($PY_VER)."
