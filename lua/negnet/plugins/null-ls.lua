return  {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = {},
  config = function()
    require("null-ls").setup({
      sources = {
        require("null-ls").builtins.diagnostics.eslint,
        require("null-ls").builtins.completion.spell,
        require("null-ls").builtins.diagnostics.phpcs,
        require("null-ls").builtins.formatting.phpcbf,
        -- require("null-ls").builtins.diagnostics.stylelint,
        require("null-ls").builtins.formatting.prettier,
      },
    })
  end
}
