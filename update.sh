#!/bin/bash

git pull origin master
git submodule init
git submodule foreach git pull origin master
git submodule update

# update command-t
# cd bundle/wincent-Command-T
# rake make

cd bundle

# update html5
cd ../othree-html5
make install
cd ../..
