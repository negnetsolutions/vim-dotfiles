-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
function RemoteCopy()
  if vim.v.event.operator == "y" and vim.v.event.regname == "+" then
    require("osc52").copy_register("+")
  end
end

vim.api.nvim_create_autocmd("TextYankPost", { callback = RemoteCopy })

-- Auto update lazy
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("VimEnter", {
  group = augroup("autoupdate"),
  callback = function()
    if require("lazy.status").has_updates then
      require("lazy").update({ show = false })
    end
  end,
})
