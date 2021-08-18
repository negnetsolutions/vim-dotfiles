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

if has("nvim")
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
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
Plug 'junegunn/gv.vim'
Plug 'mhinz/vim-signify'
Plug 'will133/vim-dirdiff'

" Other
Plug 'mattn/emmet-vim'
Plug 'junegunn/vim-peekaboo'

" Theme
if(exists('+termguicolors'))
  Plug 'KeitaNakamura/neodark.vim'
  Plug 'bling/vim-airline'
else
  Plug 'skwp/vim-colors-solarized'
endif

" COC Code Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'yaegassy/coc-intelephense', {'do': 'yarn install --frozen-lockfile'}

call plug#end()

" Initialize Settings
runtime! settings/**.vim

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
