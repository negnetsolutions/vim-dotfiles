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

set wildignorecase

" For deoplete.
if has('nvim')
  let g:deoplete#enable_at_startup = 1
  inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
  inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
endif
