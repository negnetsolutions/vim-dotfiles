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
let g:asyncomplete_auto_popup = 1


" call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
"       \ 'name': 'omni',
"       \ 'whitelist': ['*'],
"       \ 'blacklist': ['html'],
"       \ 'completor': function('asyncomplete#sources#omni#completor')
"       \  }))
