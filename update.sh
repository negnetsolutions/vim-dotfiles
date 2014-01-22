#!/bin/bash

git pull origin `git branch | sed -n '/\* /s///p'`
git submodule init
git submodule foreach git pull origin master
git submodule update

cd bundle

# update html5
cd othree-html5
make install
cd ../..
