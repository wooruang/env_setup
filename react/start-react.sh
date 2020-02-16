#!/usr/bin/env bash

if [[ $# -lt 1 ]]
then
    echo "Usage: $0 {PROJECT_NAME}"
    exit 1
fi

# The name of a Project to create.
PROJECT_NAME=$1

# Install 'create-react-app' at the global storage.
yarn global add create-react-app

# Create a react app.
create-react-app $PROJECT_NAME

