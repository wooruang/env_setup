#!/usr/bin/env bash

# Check if pyenv exists.
if [[ -x "$(command -v pyenv)" ]]
then
    echo "Info: pyenv is already installed."
    exit 1
fi

# For ubuntu desktop.
BASHFILE=~/.bashrc

# Install pyenv
echo "- Installing pyenv ..."

git clone https://github.com/pyenv/pyenv.git ~/.pyenv

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> $BASHFILE
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> $BASHFILE

echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init --path)"\n  eval "$(pyenv init -)"\nfi' >> $BASHFILE

# Install for python dependencies.
echo "- Installing for python dependencies ..."
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    # ...
    SUPPORTED=1
    
    sudo apt-get update; sudo apt-get install --no-install-recommends \
    make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev \
    libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev \
    libxmlsec1-dev libffi-dev liblzma-dev

elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
    SUPPORTED=1
    brew install openssl readline sqlite3 xz zlib
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

source $BASHFILE

# Install a virtualenv plugin.
echo "- Installing virtualenv plugin ..."
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
echo 'eval "$(pyenv virtualenv-init -)"' >> $BASHFILE

source $BASHFILE

echo "- Done installing pyenv ..."


