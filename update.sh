#!/bin/bash

git pull origin `git branch | sed -n '/\* /s///p'`
git submodule init
git submodule sync
# git submodule update --recursive
# git submodule foreach git pull origin master
git submodule foreach 'git fetch origin --tags; git checkout master; git pull' && git pull && git submodule update --init --recursive
# git submodule update

# update html5
cd bundle/othree-html5
make install
cd ../..
