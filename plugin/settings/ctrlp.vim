let g:ctrlp_working_path_mode = 'ra'

" Map normal ctrlp mode to <leader>t
let g:ctrlp_map = '<leader>t'

let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\.hg$\|\.svn$\|vendor\/symfony$',
      \ 'file': '\.exe$\|\.so$\|\.dll$' }

let g:ctrlp_root_markers = ['.git/']

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Map buffer tag mode to <leader>
nnoremap <silent> <leader>f :CtrlPBufTag<CR>
" nmap <silent> <leader>be :CtrlPBuffer<CR>

