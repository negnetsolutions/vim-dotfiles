return {
  "anuvyklack/windows.nvim",
  dependencies = {
    "anuvyklack/middleclass",
  },
  config = function()
    vim.o.winwidth = 10
    vim.o.winminwidth = 10
    vim.o.equalalways = false
    require('windows').setup()

    vim.keymap.set('n', '<C-w>z', '<Cmd>WindowsMaximize<CR>')
  end
}
