#!/bin/bash

function getScriptDirectory {
	local working=$PWD
	cd "$(dirname "${BASH_SOURCE[0]}")"
	echo $PWD
	cd "$working"
}


SCRIPT_DIR=`getScriptDirectory`

# Install git
GITCONFIG=$HOME/.gitconfig
ADD_GITCONFIG=$SCRIPT_DIR/gitconfig

echo -e "[include]"               >> $GITCONFIG 
echo -e "\tpath = $ADD_GITCONFIG" >> $GITCONFIG 

# Install vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

VIMRC=$HOME/.vimrc
ADD_VIMRC=$SCRIPT_DIR/.vimrc

echo -e "source $ADD_VIMRC" >> $VIMRC

echo "Put :PlugInstall in vim!"

