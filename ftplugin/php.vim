" PHP

let php_folding = 0        "Set PHP folding of classes and functions.
let php_html_in_strings = 1  "Syntax highlight HTML code inside PHP strings.
let php_sql_query = 1      "Syntax highlight SQL code inside PHP strings.
let php_no_shorttags = 1    "Disable PHP short tags.
let php_html_in_heredoc = 0 "Disable php in heredoc"
let php_html_in_nowdoc = 0 "Disable php in nowdoc"
let php_sql_heredoc = 0 "Disable php in heredoc"
let php_sql_nowdoc = 0 "Disable php in nowdoc"
let php_sql_query = 0 "Disable sql highlight in php"

setlocal foldmethod=indent
setlocal omnifunc=phpcomplete#CompletePHP

" S- to surround with php tag
let b:surround_45 = "<?php \r ?>"

syntax sync minlines=100
syntax sync maxlines=240
set synmaxcol=800
