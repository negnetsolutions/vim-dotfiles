
if has('nvim')
lua << EOF
require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.stylua,
        require("null-ls").builtins.diagnostics.eslint,
        require("null-ls").builtins.completion.spell,
        require("null-ls").builtins.diagnostics.phpcs,
        require("null-ls").builtins.formatting.phpcbf,
        require("null-ls").builtins.diagnostics.stylelint,
        require("null-ls").builtins.formatting.prettier,
    },
})
 require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

map <leader>xx <cmd>TroubleToggle<cr>
nmap ,bt <cmd>TroubleToggle<CR>

command ALEFix execute 'lua vim.lsp.buf.formatting()'

endif
