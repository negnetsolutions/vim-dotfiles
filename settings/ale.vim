
if has('nvim')
lua << EOF
require("null-ls").setup({
    sources = {
        require("null-ls").builtins.diagnostics.eslint,
        require("null-ls").builtins.completion.spell,
        require("null-ls").builtins.diagnostics.phpcs,
        require("null-ls").builtins.formatting.phpcbf,
        require("null-ls").builtins.diagnostics.stylelint,
        require("null-ls").builtins.formatting.prettier,
    },
})
 require("trouble").setup {
    auto_close = true,
    auto_open = false
  }
EOF

lua << EOF
vim.diagnostic.config({
    virtual_text = false,
    underline = true,
    signs = true
})
EOF

map <leader>xx <cmd>TroubleToggle<cr>
nmap ,bt <cmd>TroubleToggle<CR>

command ALEFix execute 'lua vim.lsp.buf.format { async = true }'

endif
