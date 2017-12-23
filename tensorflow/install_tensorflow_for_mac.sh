#!/bin/bash

sudo easy_install pip
pip install --upgrade virtualenv

virtualenv --system-site-packages ~/tensorflow

source ~/tensorflow/bin/activate

pip3 install --upgrade tensorflow

