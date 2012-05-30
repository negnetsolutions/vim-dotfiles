#!/bin/bash

cd ~
ln -s ~/.vim/vimrc ~/.vimrc
cd ~/.vim
git submodule init
git submodule update

# update command-t
cd bundle/wincent-Command-T
rake make
cd ../othree-html5
make install
cd ~/.vim
