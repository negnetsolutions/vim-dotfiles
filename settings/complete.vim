" ================ Completion =======================

set wildmode=list:longest

set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

" Enable omni completion.
set completeopt=longest,menuone
set omnifunc=syntaxcomplete#Complete
