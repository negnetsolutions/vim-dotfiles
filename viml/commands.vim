map <leader>xx <cmd>TroubleToggle<cr>
nmap ,bt <cmd>TroubleToggle<CR>

command ALEFix execute 'lua vim.lsp.buf.formatting()'
