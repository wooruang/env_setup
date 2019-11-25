#!/usr/bin/env bash

# Check OS!.
OS_NAME=""
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    OS_NAME="linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    OS_NAME="darwin"
#elif [[ "$OSTYPE" == "cygwin" ]]; then
#elif [[ "$OSTYPE" == "msys" ]]; then
#elif [[ "$OSTYPE" == "win32" ]]; then
#elif [[ "$OSTYPE" == "freebsd"* ]]; then
else
    echo "|===> Unknown OS. ($OSTYPE)"
    exit 1
fi

PREFIX_DIR="$HOME/Application"
COMMAND="code-server"
VERSION="2.1692-vsc1.39.2"
TARGET_DIR="code-server$VERSION-$OS_NAME-x86_64"
TARGET_GZ_FILE="$TARGET_DIR.tar.gz"
DOWNLOAD_BASE_URL="https://github.com/cdr/code-server/releases/download/$VERSION/$TARGET_FILE"

$PREFIX_DIR/$TARGET_DIR/$COMMAND --version

if [[ $? -eq 0 ]]; then
    echo "|===> $COMMAND is already exist! ($PREFIX_DIR)"
    exit 1
fi

# Download.

echo "|---> Downloading $TARGET_GZ_FILE ..."
wget -x -O $PREFIX_DIR/$TARGET_GZ_FILE -c $DOWNLOAD_BASE_URL
echo "|===> Complete! Download $TARGET_FILE."

# Extract.
if [[ ! -f $PREFIX_DIR/$TARGET_DIR ]]; then
  echo "|---> Extracting $TARGET_GZ_FILE ..."
  tar xzf $PREFIX_DIR/$TARGET_GZ_FILE -C $PREFIX_DIR
  echo "|===> Complete! Extrat $TARGET_GZ_FILE."
else
  echo "|===> Already exist $TARGET_DIR"
fi

$PREFIX_DIR/$TARGET_DIR/$COMMAND --version

if [[ $? -eq 0 ]]; then
    echo "|===> Error! install $COMMAND!($PREFIX_DIR/$TARGET_DIR/$COMMAND)"
    exit 1
fi
