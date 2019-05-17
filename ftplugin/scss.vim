" SCSS

setlocal omnifunc=csscomplete#CompleteCSS
let g:ale_use_global_executables = 1
let b:ale_fixers = {'scss': ['prettier'], 'css': ['prettier']}
