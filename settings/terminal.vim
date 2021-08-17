" Terminal keybindings.
tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l

if has('nvim')
  augroup nvim_terminal | au!
        " entering terminal buffer for the first time
        autocmd TermEnter term://* startinsert
        " switching to terminal window/buffer
        autocmd BufEnter term://* startinsert
    augroup end
endif
