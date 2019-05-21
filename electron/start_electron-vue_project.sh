#!/usr/bin/env bash

PROJ_NAME=$1

# Check a number of arguments.
if [[ $# -lt 1 ]]
then
    echo "Usage: $0 {PROJECT NAME}"
    exit 1
fi

# Create a project dir.
mkdir $PROJ_NAME
cd $PROJ_NAME

# Install if vue does not exist.
PARENT_DIR=../$(dirname $0)/../vue
/usr/bin/env bash $PARENT_DIR/install_vue-cli.sh
cd ..

# Create a electron-vue project.
echo "- Creating a electron-vue project($PROJ_NAME) ..."
$HOME/.yarn/bin/vue init simulatedgreg/electron-vue $PROJ_NAME
cd $PROJ_NAME

yarn

echo "- Done Creating a electron-vue project($PROJ_NAME) ..."
echo "-"
echo ">>> If you want to execute a $(PROJ_NAME) project to run below a command."
echo ""
echo "cd your-project-directory"
echo "yarn run dev"
