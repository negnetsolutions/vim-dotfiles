set nocompatible
set encoding=utf-8 " Necessary to show Unicode glyphs
filetype off

call plug#begin('~/.vim/plugged')

" Text manipulation
Plug 'AndrewRadev/splitjoin.vim'
Plug 'austintaylor/vim-indentobject'
Plug 'b4winckler/vim-angry'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'

" Search
Plug 'rking/ag.vim'

if has('nvim')
  Plug 'machakann/vim-highlightedyank'
endif

" Language
Plug 'stanangeloff/php.vim'
Plug 'Raimondi/delimitMate' "auto-closing
Plug 'lumiliet/vim-twig'
Plug 'chr4/nginx.vim' "nginx syntax
Plug 'pangloss/vim-javascript'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'

" Linting
if v:version > 740
  Plug 'w0rp/ale'
endif

if has("python3") == 1 && v:version >= 800
  Plug 'Shougo/denite.nvim'
  Plug 'Shougo/unite.vim'
  Plug 'Shougo/unite-outline'
  Plug 'Shougo/vimproc.vim', { 'do': 'make' }
else
  Plug 'Shougo/unite.vim'
  Plug 'Shougo/unite-outline'
  Plug 'Shougo/vimproc.vim', { 'do': 'make' }
endif

" UI
Plug 'Shougo/neomru.vim'
Plug 'sickill/vim-pasta'
Plug 'zakj/vim-showmarks'

" Tab UI
Plug 'mkitt/tabline.vim'

" Autocomplete
Plug 'vim-scripts/AutoTag'

" Tmux
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'christoomey/vim-tmux-navigator'

" Git Helpers
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

"Window Managers
Plug 'roman/golden-ratio'

" Other
Plug 'mattn/emmet-vim'

" Theme
if(exists('+termguicolors'))
  Plug 'trevordmiller/nova-vim'
  Plug 'bling/vim-airline'
else
  Plug 'skwp/vim-colors-solarized'
endif

" Language Servers
if has('nvim')
  " Plug 'autozimu/LanguageClient-neovim'
  " Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}
  " Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}
  " Plug 'ncm2/ncm2'
  " Plug 'roxma/nvim-yarp'
  " Plug 'phpactor/ncm2-phpactor'
endif

call plug#end()

" Initialize Settings
runtime! settings/**.vim
