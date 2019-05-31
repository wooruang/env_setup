#!/usr/bin/env bash

# Install node
SUPPORTED=0
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    # ...
    OS_VER=`awk -F= '/^NAME/{print $2}' /etc/os-release`
    if [[ "$OS_VER" == '"Ubuntu"' ]]; then
        SUPPORTED=1
        /usr/bin/env bash $(dirname $0)/ubuntu/install_node_for_ubuntu.sh
    else
        SUPPORTED=0
    fi

elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
    SUPPORTED=1
    /usr/bin/env bash $(dirname $0)/macos/install_node_for_mac.sh
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

if [[ $SUPPORTED -eq 0 ]]; then
    echo "ERROR: Not yet supported a type of this os($OSTYPE/$OS_VER)."
    exit 1
fi

