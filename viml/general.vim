
" ================ General Config ====================

" set relativenumber                      "Line numbers are good
" set number                      "Line numbers are good
" set backspace=indent,eol,start  "Allow backspace in insert mode
" set history=1000                "Store lots of :cmdline history
" set showcmd                     "Show incomplete cmds down the bottom
" set showmode                    "Show current mode down the bottom
" set gcr=a:blinkon0              "Disable cursor blink
"
" set autoread                    "Reload files changed outside vim

if(exists('+termguicolors'))
  set noshowmode                 "Disabled mode display
endif


" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
" set hidden

"turn on syntax highlighting
" syntax on

" ================ Search Settings  =================

nnoremap / /\v
vnoremap / /\v
" set incsearch        "Find the next match as we type the search
" set hlsearch         "Hilight searches by default
" set viminfo='100,f1  "Save up to 100 marks, enable capital marks
" set ignorecase
" set smartcase
" set showmatch
" set gdefault

" ================ Turn Off Swap Files ==============

" set noswapfile
" set nobackup
" set nowb

" ================ Indentation ======================

" set autoindent
" set smartindent
" set smarttab
" set shiftwidth=2
" set softtabstop=2
" set tabstop=2
" set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·
" set wrap
" set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

" set foldmethod=indent " fold based on indent
" set foldnestmax=3     " deepest fold is 3 levels
" set foldlevelstart=20 " open all folds by default
" set foldenable
nnoremap <Space> zA
vnoremap <Space> zA

" ================ Scrolling ========================

" set scrolloff=8         "Start scrolling when we're 8 lines away from margins
" set sidescrolloff=15
" set sidescroll=1

" ================ Faster ESC ========================
inoremap jj <ESC>

" ================ Security ========================
" set modelines=0

" ================ Remember Last location in File ========================

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" =============== Special Maps =====================

" Map F5 to remove trailing whitespace
:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif

" set mouse=a

" set ttyfast
" set lazyredraw

" set laststatus=2   " Always show the statusline

" ================ Completion =======================

" set wildmode=list:longest

" set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
" set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

" Enable omni completion.
" set completeopt=longest,menuone
" set omnifunc=syntaxcomplete#Complete

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

" set wildignorecase

" set inccommand=nosplit

" ====== NETRW ======
" set default sort order for netrw
" let g:netrw_sort_by="name"
"
" let g:netrw_browse_split=0
" let g:netrw_liststyle=3
" let g:netrw_banner=0
" let g:netrw_altv= 1
" let g:netrw_preview=1
" let g:netrw_winsize=20
" let g:netrw_hide=1
" let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

" persistent undos - undo after you re-open the file
" but this gives warnings under command line vim
" use only in macvim
if has('gui_running')
  set undodir=~/.vim/backups
  set undofile
endif

" set updatetime=100
