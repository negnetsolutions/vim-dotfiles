if has('nvim')
  " Map Telescope Keys
  nmap ,be :Telescope buffers<CR>
  nmap ,f :Telescope find_files<CR>

  lua << EOF
  require('telescope').setup{
    defaults = {
      file_ignore_patterns = { "node_modules/*", "vendor/*", ".git/*" },
      initial_mode = "normal",
    }
  }
EOF
endif
