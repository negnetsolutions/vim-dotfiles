-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.cmd([[nnoremap \ :Neotree reveal=true toggle<cr>]])

local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap
keymap("n", "vv", "<C-w>v", opts)
keymap("n", "ss", "<C-w>s", opts)

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Don't have to use Shift to get into command mode, just hit semicolon
keymap("n", ";", ":", opts)

-- Clear current search highlight by double tapping //
keymap("n", "//", ":nohlsearch<CR>", opts)

-- Folds
keymap("v", "<Space>", "za", { noremap = true, silent = true })
keymap("n", "<Space>", "za", { noremap = true, silent = true })

keymap("n", "<leader>fs", ":Telescope lsp_document_symbols<CR>", { noremap = true, silent = true })

vim.keymap.del("n", "<leader>/")
