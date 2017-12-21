" PHP

let php_folding = 0        "Set PHP folding of classes and functions.
let php_html_in_strings = 1  "Syntax highlight HTML code inside PHP strings.
let php_sql_query = 1      "Syntax highlight SQL code inside PHP strings.
let php_no_shorttags = 1    "Disable PHP short tags.

setlocal foldmethod=indent
setlocal omnifunc=phpcomplete#CompletePHP

" S- to surround with php tag
let b:surround_45 = "<?php \r ?>"
