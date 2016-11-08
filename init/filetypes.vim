" ================ Filetype Settings ========================

au BufRead,BufNewFile *.scss set filetype=scss
au BufRead,BufNewFile *.template set filetype=html
au BufRead,BufNewFile *.page set filetype=markdown
au BufRead,BufNewFile *.mks set filetype=markdown
au BufRead,BufNewFile *.tpl.php set filetype=php
au BufRead,BufNewFile *.inc set filetype=php
au BufRead,BufNewFile *.module set filetype=php
au BufNewFile,BufRead *.vim setlocal foldmethod=marker
au FileType mail set wrap linebreak nolist textwidth=0 wrapmargin=0
