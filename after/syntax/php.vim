" Don't use the PHP syntax folding 
setlocal foldmethod=manual 
" Turn on PHP fast folds 
" EnableFastPHPFolds 

au FileType php set omnifunc=phpcomplete#CompletePHP
let php_sql_query=1
let php_htmlInStrings=1

