#!/usr/bin/env bash

# Check if pyenv exists.
if [[ -x "$(command -v pyenv)" ]]
then
    echo "Info: pyenv is already installed."
    exit 1
fi

# Install pyenv
echo "- Installing pyenv ..."

git clone https://github.com/pyenv/pyenv.git ~/.pyenv

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile

echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bash_profile

# Install a virtualenv plugin.
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bash_profile

echo "- Done installing pyenv ..."


