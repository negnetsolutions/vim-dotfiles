" ================ Completion =======================

set wildmode=list:longest

set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

" Enable omni completion.
set completeopt=longest,menuone
set omnifunc=syntaxcomplete#Complete

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
" let g:asyncomplete_auto_popup = 1

set wildignorecase

if has('nvim')
  " enable ncm2 for all buffers
  " autocmd BufEnter * call ncm2#enable_for_buffer()
  " au User Ncm2PopupOpen set completeopt=noinsert,menuone,noselect
  " au User Ncm2PopupClose set completeopt=menuone
  "
  " " IMPORTANT: :help Ncm2PopupOpen for more information
  " set completeopt=noinsert,menuone,noselect
endif
