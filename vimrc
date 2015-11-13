" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set encoding=utf-8 " Necessary to show Unicode glyphs

filetype off                  " required

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
Plugin 'gregsextonv.git'
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
Plugin 'tpope/vim-five.git'
Plugin 'tpope/vim-pathogen'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tristen/vim-sparkup'
Plugin 'terryma/vim-expand-region'
Plugin 'vim-scripts/AnsiEsc.vim'
Plugin 'vim-scripts/AutoTag'
Plugin 'vim-scripts/argtextobj.vim'
Plugin 'vim-scripts/L9'
Plugin 'vim-scripts/lastpos.vim'
Plugin 'vim-scripts/sudo.vim'
Plugin 'wellle/tmux-complete.vim'
Plugin 'zakj/vim-showmarks'
Plugin 'Shougo/neocomplcache.vim'

call vundle#end()            " required
filetype plugin indent on    " required

" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink

set autoread                    "Reload files changed outside vim

set spell                       "Enable Spelling


" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

" ================ Search Settings  =================

nnoremap / /\v
vnoremap / /\v
set incsearch        "Find the next match as we type the search
set hlsearch         "Hilight searches by default
set viminfo='100,f1  "Save up to 100 marks, enable capital marks
set ignorecase
set smartcase
set showmatch
set gdefault

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works in MacVim (gui) mode.

if has('gui_running')
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set wrap
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=syntax " fold based on indent
set foldnestmax=3     " deepest fold is 3 levels
set foldlevelstart=20 " open all folds by default
set foldenable
let javaScript_fold=1 " turn on javascript folding
nnoremap <Space> zA
vnoremap <Space> zA

" ================ Completion =======================

set wildmode=list:longest

set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Filetype Settings ========================

au BufRead,BufNewFile *.scss set filetype=scss
au BufRead,BufNewFile *.template set filetype=html
au BufRead,BufNewFile *.page set filetype=markdown
au BufRead,BufNewFile *.mks set filetype=markdown
au BufRead,BufNewFile *.tpl.php set filetype=html
au BufNewFile,BufRead *.vim setlocal foldmethod=marker
au FileType mail set wrap linebreak nolist textwidth=0 wrapmargin=0

" ================ Faster ESC ========================
inoremap jj <ESC>
inoremap kk <ESC>

" ================ Vim RC Management ========================

nnoremap <leader>ev <C-w>s<C-w>j<C-w>L:e ~/.vim/vimrc<cr>
map <leader>er :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" ================ Security ========================
set modelines=0

" ================ Remember Last location in File ========================

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" =============== Special Maps =====================

" Map F5 to remove trailing whitespace
:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" =========== Clipboard
" set clipboard=unnamed
nnoremap <silent> <F11> :YRShow<CR>
