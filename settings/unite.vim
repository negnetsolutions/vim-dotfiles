if has("python3") == 1 && v:version >= 800
  " Use Denite
  call denite#custom#option('default', {
        \ 'prompt': '»',
        \ 'cursor_wrap': v:true,
        \ 'auto_resize': v:true,
        \ 'highlight_mode_insert': 'WildMenu'
        \ })

  call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
  call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')
  call denite#custom#map('insert', '<C-[>', '<denite:enter_mode:normal>', 'noremap')
  call denite#custom#map('normal', '<C-[>', '<denite:quit>', 'noremap')

  " Map Denite Keys
  nmap <silent> <leader>be :Denite buffer<CR>
  nmap <silent> <leader>t :DeniteBufferDir file_rec -no-highlight-matched-char -no-highlight-matched-range -no-highlight-preview-line<CR>
  call denite#custom#var('outline', 'options', ['--langmap=php:.engine.inc.module.theme.install.php'])
  call denite#custom#var('outline', 'ignore_types', ['v','d'])
  nmap <silent> <leader>f :Denite outline<CR>
  nnoremap <silent> <leader>r :Denite file_mru<CR>
else
  " Use Unite

  " Start in insert mode
  let g:unite_enable_start_insert = 1

  " Use Fuzzy Matcher
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
  call unite#filters#sorter_default#use(['sorter_rank'])
  call unite#filters#sorter_default#use(['sorter_selecta'])
  call unite#custom#source('file,file/new,buffer,file_rec,line,outline,file_mru', 'matchers', 'matcher_fuzzy')

  " Map Unite Keys
  nmap <silent> <leader>be :Unite -no-split buffer -start-insert<CR>
  nmap <silent> <leader>t :Unite -no-split file -start-insert<CR>
  nmap <silent> <leader>f :Unite -no-split outline -start-insert<CR>
  nnoremap <silent> <leader>r :Unite -no-split file_mru -start-insert<CR>

  " ignore certain files and directories while searching
  call unite#custom_source('file,file_rec,file_rec/async,grep',
        \ 'ignore_pattern', join([
        \ '\.git/',
        \ '\.svn/',
        \ '\.bundle/',
        \ '\.sass-cache/',
        \ '\.DS_Store',
        \ 'vendor/',
        \ ], '\|'))
endif
