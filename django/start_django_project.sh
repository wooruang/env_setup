#!/usr/bin/env bash

PY_VER=$1
PY_ENV=$2
PROJ_NAME=$3
APP_NAME=$4

# Check a number of arguments.
if [[ $# -lt 4 ]]
then
    echo "Usage: $0 {PYTHON VERION} {VIRTUALENV_NAME} {PROJECT_NAME} {APP_NAME}"
    exit 1
fi

# Install if django does not exist.
PARENT_DIR=$(dirname $0)
/usr/bin/env bash $PARENT_DIR/django_install.sh $PY_VER $PY_ENV

# Create django project.
echo "- Create a django project($PROJ_NAME)"
eval "$(pyenv init -)"
pyenv shell ${PY_ENV}
django-admin startproject $PROJ_NAME

# Create django app.
echo "- Create a django app($APP_NAME)"
cd $PROJ_NAME
python manage.py startapp $APP_NAME