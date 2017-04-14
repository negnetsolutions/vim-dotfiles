set nocompatible
set encoding=utf-8 " Necessary to show Unicode glyphs
filetype off

call plug#begin('~/.vim/plugged')

" Text manipulation
Plug 'AndrewRadev/splitjoin.vim'
Plug 'austintaylor/vim-indentobject'
Plug 'b4winckler/vim-angry'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'

" Search
Plug 'rking/ag.vim'

" Language
Plug 'stanangeloff/php.vim'

" syntax
Plug 'Raimondi/delimitMate'
Plug 'lumiliet/vim-twig'
Plug 'chr4/nginx.vim' "nginx syntax

if v:version > 740
  Plug 'w0rp/ale'
endif

" UI
Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/neomru.vim'
Plug 'sickill/vim-pasta'
Plug 'sjl/gundo.vim'
Plug 'zakj/vim-showmarks'

" Tab UI
Plug 'mkitt/tabline.vim'

" Autocomplete
Plug 'vim-scripts/AutoTag'

" Tmux
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'christoomey/vim-tmux-navigator'

" Airline
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Theme
Plug 'skwp/vim-colors-solarized'

" Git Helpers
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

"Window Managers
Plug 'roman/golden-ratio'

" Other
Plug 'tristen/vim-sparkup'


call plug#end()

" Initialize Settings
runtime! init/**.vim
