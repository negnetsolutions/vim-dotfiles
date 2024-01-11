-- LSP keymaps
return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      file_ignore_patterns = { "node_modules/*", "vendor/*", "react-dist/*" },
    },
  },
}
