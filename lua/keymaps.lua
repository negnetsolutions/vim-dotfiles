local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

keymap('v', '<Leader>y', '"+y', opts)
keymap('v', '<Leader>d', '"+d', opts)
keymap('v', '<Leader>p', '"+p', opts)
keymap('v', '<Leader>P', '"+P', opts)
keymap('n', '<Leader>p', '"+p', opts)
keymap('n', '<Leader>P', '"+P', opts)

-- Don't have to use Shift to get into command mode, just hit semicolon
keymap('n', ';', ':', opts)

-- Window Management
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)
keymap('n', 'vv', '<C-w>v', opts)
keymap('n', 'ss', '<C-w>s', opts)

-- Clear current search highlight by double tapping //
keymap('n', '//', ':nohlsearch<CR>', opts)

-- Search
keymap('n', '/', '/\\v', opts)
keymap('v', '/', '/\\v', opts)

-- Paste
keymap('n', 'Y', 'y$', opts)

-- Folds
keymap('v', '<Space>',  'za', { noremap = true, silent = true })
keymap('n', '<Space>',  'za', { noremap = true, silent = true })

-- FASTER ESC
keymap('i', 'jj',  '<ESC>', { noremap = true, silent = true })

