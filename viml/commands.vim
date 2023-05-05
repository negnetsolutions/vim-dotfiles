map <leader>xx <cmd>TroubleToggle<cr>
nmap ,bt <cmd>TroubleToggle<CR>

command ALEFix execute 'lua vim.lsp.buf.format({async = true,filter = function(client) return client.name ~= "intelephense" end})'
