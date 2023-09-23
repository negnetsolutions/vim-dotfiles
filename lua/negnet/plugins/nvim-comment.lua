return {
  "terrortylor/nvim-comment",
  config = function()
    require('nvim_comment').setup({
      create_mappings = true,
      comment_empty = true,
      hook = function()
        require("ts_context_commentstring.internal").update_commentstring()
      end,
    })
    vim.api.nvim_set_keymap('n', '<leader>/', ':CommentToggle<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('v', '<leader>/', ':CommentToggle<CR>', { noremap = true, silent = true })
  end
}
