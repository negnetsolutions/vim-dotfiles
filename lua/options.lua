vim.o.number = true
vim.o.relativenumber = true
vim.o.backspace="indent,eol,start"
vim.o.history=1000
vim.o.showcmd = true
vim.o.showmode = true
vim.o.gcr="a:blinkon0"
vim.o.autoread = true
vim.o.hidden = true
vim.o.updatetime = 100
vim.o.wildignorecase = true
vim.o.inccommand="nosplit"
vim.o.mouse="a"
vim.o.ttyfast=true
vim.o.lazyredraw=true
vim.o.laststatus=2
vim.o.modelines=0
vim.o.title = true

-- Completion
vim.o.wildmode="list:longest"
vim.o.wildmenu = true
vim.o.wildignore="*.o,*.obj,*~"

--Enable omni completion.
vim.o.completeopt="longest,menuone"
vim.o.omnifunc="syntaxcomplete#Complete"

vim.keymap.set('i', '<Tab>', function()
    return vim.fn.pumvisible() == 1 and '<C-N>' or '<Tab>'
end, {expr = true})
vim.keymap.set('i', '<S-Tab>', function()
    return vim.fn.pumvisible() == 1 and '<C-p>' or '<S-Tab>'
end, {expr = true})
vim.keymap.set('i', '<cr>', function()
    return vim.fn.pumvisible() == 1 and '<C-y>' or '<cr>'
end, {expr = true})

-- SEARCH
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.viminfo="'100,f1"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.showmatch = true
vim.o.gdefault = true

-- Turn off swap
vim.o.swapfile = false
vim.noswapfile = true
vim.nobackup = true
vim.nowb = true

-- Indentation
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.shiftwidth=2
vim.o.softtabstop=2
vim.o.tabstop=2
vim.o.expandtab = true
vim.o.listchars = "tab:|.,trail:_,extends:>,precedes:<,nbsp:~,eol:¬"
vim.o.wrap = true
vim.o.linebreak = true

-- Folds
vim.api.nvim_set_keymap('v', '<Space>',  'za', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>',  'za', { noremap = true, silent = true })
vim.o.foldmethod="indent"
vim.o.foldnestmax=3
vim.o.foldlevelstart=20
vim.o.foldenable = true

-- SCROLLING
vim.o.scrolloff=8
vim.o.sidescrolloff=15
vim.o.sidescroll=1

-- NETRW
vim.g.netrw_sort_by="name"
vim.g.netrw_browse_split=0
vim.g.netrw_liststyle=3
vim.g.netrw_banner=0
vim.g.netrw_altv= 1
vim.g.netrw_preview=1
vim.g.netrw_winsize=20
vim.g.netrw_hide=1
vim.g.netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

-- FASTER ESC
vim.api.nvim_set_keymap('i', 'jj',  '<ESC>', { noremap = true, silent = true })
