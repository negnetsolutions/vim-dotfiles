if has("python3") == 1 && v:version >= 800
  " Use Denite
  call denite#custom#option('default', {
        \ 'prompt': '»',
        \ 'cursor_wrap': v:true,
        \ 'auto_resize': v:true,
        \ 'highlight_mode_insert': 'WildMenu'
        \ })

  call denite#custom#var('outline', 'options', ['--langmap=php:.engine.inc.module.theme.install.php'])
  call denite#custom#var('outline', 'ignore_types', ['v','d'])

  " Map Denite Keys
  nmap ,be :Denite buffer<CR>
  nmap ,t :DeniteBufferDir file_rec -no-highlight-matched-char -no-highlight-matched-range -no-highlight-preview-line<CR>
  nmap ,f :Denite outline<CR>
  nnoremap ,r :Denite file_mru<CR>

  " Define mappings
  autocmd FileType denite call s:denite_my_settings()
  function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>
          \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> d
          \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p
          \ denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> q
          \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> i
          \ denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <Space>
          \ denite#do_map('toggle_select').'j'
  endfunction

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
