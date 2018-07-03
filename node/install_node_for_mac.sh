##
# Install node for mac
##

nvm 
if [[ $? -eq 0 ]]
then
    echo "Nvm O - Already nvm is installed."
else
    echo "Nvm X - Nvm is not installed."
    echo "Installing nvm ..."
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
    source ~/.bash_profile

    nvm
    if [[ $? -eq 0 ]]
    then
        echo "Completed installing nvm." 
    else
        echo "Failed installing nvm."
        exit 1
    fi
fi

node
if [[ $? -eq 0 ]]
then
    echo "Node O - Already node is installed."
else
    echo "Node X - Node is not installed."
    echo "Installing node ..."
    nvm install stable
    nvm use stable
    
    node
    if [[ $? -eq 0 ]]
    then
        echo "Completed installing node."
    else
        echo "Failed installing node."
        exit 1
    fi
fi


