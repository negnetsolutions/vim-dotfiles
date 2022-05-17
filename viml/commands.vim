map <leader>xx <cmd>TroubleToggle<cr>
nmap ,bt <cmd>TroubleToggle<CR>

command ALEFix execute 'lua vim.lsp.buf.formatting()'

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
