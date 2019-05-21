#!/usr/bin/env bash

PY_VER=$1

# Check a number of arguments.
if [[ $# -lt 1 ]]
then
    echo "Usage: $0 {PYTHON VERION}"
    exit 1
fi

# Install if pyenv does not exist.
PARENT_DIR=$(dirname $0)
/usr/bin/env bash $PARENT_DIR/pyenv_install.sh

# Install python.
SUPPORTED=0
echo "- Installing python $PY_VER ($OSTYPE)..."
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    # ...
    SUPPORTED=1
    env PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install -s $PY_VER
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
    SUPPORTED=1
    env PYTHON_CONFIGURE_OPTS="--enable-framework" pyenv install -s $PY_VER
elif [[ "$OSTYPE" == "cygwin" ]]; then
    # POSIX compatibility layer and Linux environment emulation for Windows
    SUPPORTED=0
elif [[ "$OSTYPE" == "msys" ]]; then
    # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
    SUPPORTED=0
elif [[ "$OSTYPE" == "win32" ]]; then
    # I'm not sure this can happen.
    SUPPORTED=0
elif [[ "$OSTYPE" == "freebsd"* ]]; then
    # ...
    SUPPORTED=0
else
    SUPPORTED=0
fi

if [[ $? -ne 0 ]]; then
    echo "ERROR: Could not install python $PY_VER"
    exit 1
fi

if [[ $SUPPORTED -eq 0 ]]; then
    echo "ERROR: Not yet supported a type of this os($OSTYPE)."
    exit 1
fi

echo "- Done installing python $PY_VER..."
