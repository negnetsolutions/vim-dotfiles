if has('nvim')
  " Terminal keybindings.
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-h> <C-\><C-N><C-w>h
  tnoremap <C-j> <C-\><C-N><C-w>j
  tnoremap <C-k> <C-\><C-N><C-w>k
  tnoremap <C-l> <C-\><C-N><C-w>l

  augroup nvim_terminal | au!
    " switching to terminal window/buffer
    autocmd BufWinEnter,WinEnter term://* startinsert
    " back to normal mode when leaving term
    autocmd BufLeave term://* stopinsert
    augroup end
endif
