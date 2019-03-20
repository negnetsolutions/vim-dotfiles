" Javascript

setlocal omnifunc=javascriptcomplete#CompleteJS
let javaScript_fold=1 " turn on javascript folding
let b:ale_fixers = {'javascript': ['prettier', 'eslint']}
