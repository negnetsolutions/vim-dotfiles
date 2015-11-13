"mark syntax errors with :signs
let g:syntastic_enable_signs=1
"automatically jump to the error when saving the file
let g:syntastic_auto_jump=1 
"show the error list automatically
let g:syntastic_auto_loc_list=1
"don't care about warnings
" let g:syntastic_quiet_warnings=1
let g:syntastic_quiet_messages = {'level': 'warnings'}

let g:syntastic_error_symbol   = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '»'
let g:syntastic_style_warning_symbol = '»'

let g:syntastic_html_tidy_ignore_errors = [
			\ 'trimming empty <i>',
			\ 'trimming empty <span>',
			\ '<input> proprietary attribute \"autocomplete\"',
			\ 'proprietary attribute \"role\"',
			\ 'proprietary attribute \"hidden\"',
			\ 'proprietary attribute \"ng-',
			\ '<svg> is not recognized!',
      \ '<g> is not recognized!',
      \ '<animatetransform> is not recognized!',
			\ 'discarding unexpected <svg>',
			\ 'discarding unexpected </svg>',
			\ '<rect> is not recognized!',
      \ '<path> is not recognized!',
			\ 'discarding unexpected <rect>'
			\ ]
