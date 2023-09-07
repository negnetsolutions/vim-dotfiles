local options = {
  number = true,
  relativenumber = true,
  backspace = "indent,eol,start",
  history = 1000,
  showcmd = true,
  showmode = true,
  gcr = "a:blinkon0",
  autoread = true,
  hidden = true,
  updatetime = 100,
  wildignorecase = true,
  inccommand = "nosplit",
  mouse = "a",
  ttyfast = true,
  lazyredraw = true,
  laststatus = 2,
  modelines = 0,
  title = true,
  -- Completion
  wildmode = "list:longest",
  wildmenu = true,
  wildignore = "*.o,*.obj,*~",
  --Enable omni completion.
  completeopt = { 'menu', 'menuone', 'noselect' },
  -- SEARCH
  incsearch = true,
  hlsearch = true,
  viminfo = "'100,f1",
  ignorecase = true,
  smartcase = true,
  showmatch = true,
  gdefault = true,
  -- Turn off swap
  swapfile = false,
  -- Indentation
  autoindent = true,
  smartindent = true,
  smarttab = true,
  shiftwidth = 2,
  softtabstop = 2,
  tabstop = 2,
  expandtab = true,
  listchars = "tab:|.,trail:_,extends:>,precedes:<,nbsp:~,eol:¬",
  wrap = true,
  linebreak = true,
  -- Folds
  foldmethod = "indent",
  foldnestmax = 3,
  foldlevelstart = 20,
  foldenable = true,
  -- SCROLLING
  scrolloff = 8,
  sidescrolloff = 15,
  sidescroll = 1,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.noswapfile = true
vim.nobackup = true
vim.nowb = true

-- NETRW
vim.g.netrw_sort_by = "name"
vim.g.netrw_browse_split = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
vim.g.netrw_altv = 1
vim.g.netrw_preview = 1
vim.g.netrw_winsize = 20
vim.g.netrw_hide = 1
vim.g.netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

vim.opt.termguicolors = true
