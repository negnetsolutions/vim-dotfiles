#!/bin/bash

git pull origin master
git submodule foreach git pull origin master

# update command-t
cd bundle/wincent-Command-T
rake make
cd ../..
