if has('nvim')

  nmap ,t :CocList outline<CR>

  " GoTo code navigation.
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gr <Plug>(coc-references)

  let g:coc_user_config = {}
  let g:coc_user_config['coc.preferences.jumpCommand'] = ':drop'

  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')

endif
