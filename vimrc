set nocompatible
set encoding=utf-8 " Necessary to show Unicode glyphs
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'rking/ag.vim'
Plugin 'ap/vim-css-color'
Plugin 'austintaylor/vim-indentobject'
Plugin 'b4winckler/vim-angry'
Plugin 'bling/vim-airline'
Plugin 'godlygeek/tabular'
Plugin 'mkitt/tabline.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'sickill/vim-pasta'
Plugin 'skwp/greplace.vim'
Plugin 'skwp/vim-colors-solarized'
Plugin 'skwp/vim-indexed-search'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-scripts/AnsiEsc.vim'
Plugin 'vim-scripts/AutoTag'
Plugin 'vim-scripts/argtextobj.vim'
Plugin 'vim-scripts/L9'
Plugin 'vim-scripts/lastpos.vim'
Plugin 'vim-scripts/sudo.vim'
Plugin 'gregsexton/gitv'
Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Initialize Settings
runtime! init/**.vim
