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

endif
