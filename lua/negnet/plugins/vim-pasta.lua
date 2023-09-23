return {
  "sickill/vim-pasta",
  config = function()
    vim.g.pasta_disabled_filetypes = { "netrw", "python", "coffee", "markdown", "yaml", "slim" }
  end
}
