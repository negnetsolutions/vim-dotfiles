set nocompatible
set encoding=utf-8 " Necessary to show Unicode glyphs
filetype off

call plug#begin('~/.vim/plugged')

Plug 'AndrewRadev/splitjoin.vim'
Plug 'rking/ag.vim'
Plug 'ap/vim-css-color'
Plug 'austintaylor/vim-indentobject'
Plug 'b4winckler/vim-angry'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'godlygeek/tabular'
Plug 'mhinz/vim-signify'
Plug 'mkitt/tabline.vim'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/syntastic'
Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'
Plug 'Shougo/neomru.vim'
Plug 'sickill/vim-pasta'
Plug 'sjl/gundo.vim'
Plug 'skwp/greplace.vim'
Plug 'skwp/vim-colors-solarized'
Plug 'skwp/vim-indexed-search'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tristen/vim-sparkup'
Plug 'vim-scripts/AnsiEsc.vim'
Plug 'vim-scripts/AutoTag'
Plug 'vim-scripts/argtextobj.vim'
Plug 'vim-scripts/L9'
Plug 'vim-scripts/lastpos.vim'
Plug 'vim-scripts/sudo.vim'
Plug 'wellle/tmux-complete.vim'
Plug 'zakj/vim-showmarks'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/neocomplete.vim'
Plug 'gregsexton/gitv'
Plug 'tpope/vim-fugitive'

call plug#end()

" Initialize Settings
runtime! init/**.vim
