" Start in insert mode
let g:unite_enable_start_insert = 1

" Use Fuzzy Matcher
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file,file/new,buffer,file_rec,line,outline,file_mru', 'matchers', 'matcher_fuzzy')

" Map Unite Keys
nmap <silent> <leader>be :Unite buffer -no-start-insert<CR>
nmap <silent> <leader>t :Unite file -start-insert<CR>
nmap <silent> <leader>f :Unite outline -start-insert<CR>
nnoremap <silent> <leader>r :Unite file_mru -start-insert<CR>

" ignore certain files and directories while searching
call unite#custom_source('file,file_rec,file_rec/async,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ '\.bundle/',
      \ '\.sass-cache/',
      \ '\.DS_Store',
      \ 'vendor/',
      \ ], '\|'))
