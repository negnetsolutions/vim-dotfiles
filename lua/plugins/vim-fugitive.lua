return {
  "tpope/vim-fugitive",
  config = function(_, opts)
    -- Shorten function name
    local keymap = vim.api.nvim_set_keymap
    keymap("n", "<leader>gf", ":Git<CR>", { noremap = true, silent = true })
    keymap("n", "<leader>gl", ":0GcLog<CR>", { noremap = true, silent = true })
  end,
}
