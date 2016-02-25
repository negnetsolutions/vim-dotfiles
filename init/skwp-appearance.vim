" http://ethanschoonover.com/solarized/vim-colors-solarized
colorscheme solarized
set background=dark

let g:solarized_termtrans=1
let g:solarized_termcolors=16

set mouse=a

if !has('nvim')
  set ttymouse=xterm2
endif

set ttyfast

set laststatus=2   " Always show the statusline

let g:airline_theme= 'solarized'
let g:airline_powerline_fonts = 1

