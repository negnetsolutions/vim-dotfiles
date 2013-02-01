" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" =============== Pathogen Initialization ===============
" This loads all the plugins in ~/.vim/bundle
" Use tpope's pathogen plugin to manage all other plugins

  runtime bundle/tpope-vim-pathogen/autoload/pathogen.vim
  call pathogen#infect()

  if $SUDO_USER == ''
    call pathogen#infect('non-root-bundles')
  endif

  call pathogen#helptags()

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

" set nowrap       "Don't wrap lines
" set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=syntax " fold based on indent
set foldnestmax=3     " deepest fold is 3 levels
" set nofoldenable      " dont fold by default
let javaScript_fold=1 " turn on javascript folding
nnoremap <Space> za
vnoremap <Space> za

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

" au BufNewFile,BufRead *.js setlocal foldmethod=marker
" au BufNewFile,BufRead *.js setlocal foldmarker={,}

au BufNewFile,BufRead *.vim setlocal foldmethod=marker

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
