" ================ General Config ====================

set relativenumber                      "Line numbers are good
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink

set autoread                    "Reload files changed outside vim

" set spell                       "Enable Spelling


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
nnoremap <Space> zA
vnoremap <Space> zA

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Faster ESC ========================
inoremap jj <ESC>

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

" Unset relative number when focus lost
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

:au FocusLost * :set norelativenumber
:au FocusGained * :set relativenumber

:au BufLeave * :set norelativenumber
:au BufEnter * :set relativenumber
