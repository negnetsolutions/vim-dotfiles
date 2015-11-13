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
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'godlygeek/tabular'
Plugin 'mhinz/vim-signify'
Plugin 'mkitt/tabline.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
Plugin 'Shougo/unite.vim'
Plugin 'sickill/vim-pasta'
Plugin 'sjl/gundo.vim'
Plugin 'skwp/greplace.vim'
Plugin 'skwp/vim-colors-solarized'
Plugin 'skwp/vim-indexed-search'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-pathogen'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tristen/vim-sparkup'
Plugin 'vim-scripts/AnsiEsc.vim'
Plugin 'vim-scripts/AutoTag'
Plugin 'vim-scripts/argtextobj.vim'
Plugin 'vim-scripts/L9'
Plugin 'vim-scripts/lastpos.vim'
Plugin 'vim-scripts/sudo.vim'
Plugin 'wellle/tmux-complete.vim'
Plugin 'zakj/vim-showmarks'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/neocomplete.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Initialize Settings
runtime! init/**.vim
