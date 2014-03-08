" http://ethanschoonover.com/solarized/vim-colors-solarized
colorscheme solarized
set background=dark

" Make it beautiful - colors and fonts
if has("gui_running")
  "tell the term has 256 colors
  set t_Co=256

  " Show tab number (useful for Cmd-1, Cmd-2.. mapping)
  " For some reason this doesn't work as a regular set command,
  " (the numbers don't show up) so I made it a VimEnter event
  autocmd VimEnter * set guitablabel=%N:\ %t\ %M

  set lines=60
  set columns=190

  " set guifont=Inconsolata:h20,Monaco:h17
  " set guifont=DejaVu\ Sans\ Mono:h12
  " set guifont=Menlo:h13
  set guifont=Source\ Code\ Pro:h13

  " sej colorcolumn=0

else
  "dont load csapprox if we no gui support - silences an annoying warning
  let g:CSApprox_loaded = 1
  let g:solarized_termtrans=1
  let g:solarized_termcolors=16
  set mouse=a
  set ttymouse=xterm2
  set ttyfast
endif

" let g:Powerline_symbols = 'fancy'
" set t_Co=256
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
" let g:Powerline_theme = 'skwp'
" let g:Powerline_colorscheme = 'skwp'
let g:airline_theme= 'solarized'
let g:airline_powerline_fonts = 1

