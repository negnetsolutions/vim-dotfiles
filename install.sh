#!/bin/bash

cd ~
git clone git@github.com:negnetsolutions/vim-dotfiles.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
cd ~/.vim
git submodule init
git submodule update
