#!/bin/bash

git pull origin master
git submodule init
git submodule foreach git pull origin master
git submodule update

cd bundle

# update html5
cd othree-html5
make install
cd ../..
