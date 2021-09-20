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

" UI
Plug 'sickill/vim-pasta'
Plug 'zakj/vim-showmarks'

" Tab UI
Plug 'mkitt/tabline.vim'

" Autocomplete
Plug 'vim-scripts/AutoTag'
if has("nvim")
  " COC Code Completion
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'yaegassy/coc-intelephense', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-tabnine', {'do': 'yarn install --frozen-lockfile'}
endif

" Motion
Plug 'justinmk/vim-sneak'

" Tmux
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'christoomey/vim-tmux-navigator'

" Git Helpers
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'will133/vim-dirdiff'
Plug 'mhinz/vim-signify'

" Text Expansion
Plug 'mattn/emmet-vim'

" Register maintenance
if has('nvim')
  Plug 'junegunn/vim-peekaboo'
  Plug 'machakann/vim-highlightedyank'
endif

" Indent Highlighters
if has('nvim')
  Plug 'lukas-reineke/indent-blankline.nvim'
endif

" Telescope
if has('nvim')
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'fannheyward/telescope-coc.nvim'
endif

" Theme
if(exists('+termguicolors'))
  " Main Theme
  Plug 'EdenEast/nightfox.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'yamatsum/nvim-nonicons'

  " Status Bar
  Plug 'itchyny/lightline.vim'
else
  Plug 'skwp/vim-colors-solarized'
endif

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
