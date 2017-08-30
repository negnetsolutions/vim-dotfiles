" http://ethanschoonover.com/solarized/vim-colors-solarized
" colorscheme solarized
colorscheme nova
set background=dark
set t_Co=256

if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif

" SOLARIZED Settings
" let g:solarized_termtrans=1
" let g:solarized_termcolors=16
" let g:airline_theme= 'solarized'

set mouse=a

if !has('nvim')
  set ttymouse=xterm2
endif

set ttyfast

set laststatus=2   " Always show the statusline

let g:airline_powerline_fonts = 1

