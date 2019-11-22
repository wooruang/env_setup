#!/usr/bin/env bash

git clone https://github.com/tensorflow/tensorflow.git tensorflow-src

cd tensorflow-src

git checkout v2.0.0

./configure

bazel --config=v2 --config=mkl

