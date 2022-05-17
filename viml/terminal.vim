
" Terminal keybindings.
tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l

" Change vim dir to term pwd.
tnoremap <C-A> pwd\| tmux loadb -<CR><C-\><C-n>:cd <C-r>+<CR>i

augroup nvim_terminal
  autocmd!
  " switching to terminal window/buffer
  autocmd BufWinEnter,WinEnter term://*  startinsert
  " back to normal mode when leaving term
  autocmd BufLeave term://* stopinsert
augroup END
