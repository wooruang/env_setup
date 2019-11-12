#!/usr/bin/env bash

bazel --version

if [[ $? -eq 0 ]]; then
    echo "bazel is already exist!"
    exit 1
fi

BAZEL_VERSION="1.1.0"

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    BAZEL_INSTALLER="bazel-$BAZEL_VERSION-installer-linux-x86_64.sh"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    BAZEL_INSTALLER="bazel-$BAZEL_VERSION-installer-darwin-x86_64.sh"
#elif [[ "$OSTYPE" == "cygwin" ]]; then
#elif [[ "$OSTYPE" == "msys" ]]; then
#elif [[ "$OSTYPE" == "win32" ]]; then
#elif [[ "$OSTYPE" == "freebsd"* ]]; then
else
    echo "Unknown OS."
    exit 1
fi
 
BAZEL_INSTALLER_URL="https://github.com/bazelbuild/bazel/releases/download/$BAZEL_VERSION/$BAZEL_INSTALLER"

# Download bazel.
if [[ ! -f $BAZEL_INSTALLER ]]; then
    wget $BAZEL_INSTALLER_URL
else
    echo "Already exist $BAZEL_INSTALLER"
fi

if [[ ! -f $BAZEL_INSTALLER ]]; then
    echo "Does not exist $BAZEL_INSTALLER"
    exit 1
fi

# Install bazel.
chmod +x $BAZEL_INSTALLER
bash $BAZEL_INSTALLER --user

# Set environment.
# This path is fixed in a installer of bazel.
BAZEL_BIN_DIR="$HOME/bin"
source $HOME/.bash_profile
if [[ ":$PATH:" == *":$BAZEL_BIN_DIR:"* ]]; then
    echo "Already PATH exist $BAZEL_BIN_DIR"
else
    echo "Add Path in $HOME/.bash_profile"
    echo 'export PATH=$PATH:'$BAZEL_BIN_DIR >> $HOME/.bash_profile
    source $HOME/.bash_profile 
fi

bazel --version

