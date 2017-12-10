#!/bin/bash

function getScriptDirectory {
	local working=$PWD
	cd "$(dirname "${BASH_SOURCE[0]}")"
	echo $PWD
	cd "$working"
}


SCRIPT_DIR=`getScriptDirectory`

GITCONFIG=$HOME/.gitconfig
ADD_GITCONFIG=$SCRIPT_DIR/gitconfig

echo -e "[include]"               >> $GITCONFIG 
echo -e "\tpath = $ADD_GITCONFIG" >> $GITCONFIG 

