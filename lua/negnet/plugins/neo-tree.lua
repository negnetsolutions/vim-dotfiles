return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    -- Unless you are still migrating, remove the deprecated commands from v1.x
    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

    require("neo-tree").setup({
      source_selector = {
        winbar = false,
        statusline = false
      },
      filesystem = {
        hijack_netrw_behavior = "open_current",
      }
    })

    vim.cmd([[nnoremap \ :Neotree reveal=true toggle<cr>]])
  end
}
