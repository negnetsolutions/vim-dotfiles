set t_Co=256

if( exists('+termguicolors'))
  colorscheme nova
else
  colorscheme solarized
  " SOLARIZED Settings
  let g:solarized_termtrans=1
  let g:solarized_termcolors=16
  let g:airline_theme= 'solarized'
endif

set background=dark

if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif

set mouse=a

if !has('nvim')
  set ttymouse=xterm2
endif

set ttyfast

set laststatus=2   " Always show the statusline

let g:airline_powerline_fonts = 1
