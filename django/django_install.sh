#!/usr/bin/env bash

PY_VER=$1
PY_ENV=$2
# Check a number of arguments.
if [[ $# -lt 2 ]]
then
    echo "Usage: $0 {PYTHON VERION} {VIRTUALENV_NAME}"
    exit 1
fi

# Install if virtualenv does not exist.
PARENT_DIR=$(dirname $0)/../pyenv
/usr/bin/env bash $PARENT_DIR/make_new_virtualenv.sh $PY_VER $PY_ENV

# Install Django.
echo "- Installing django ..."
eval "$(pyenv init -)"
pyenv shell ${PY_ENV}
pip install django

echo "- Done installing django ..."
