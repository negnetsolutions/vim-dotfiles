if has('nvim')
  " Map Telescope Keys
  nmap ,be :Telescope buffers<CR>
  nmap ,f :Telescope find_files<CR>

  " Use Telescope for doc symbols.
  nmap ,t :Telescope coc document_symbols<CR>

  lua << EOF
  require('telescope').load_extension('coc')
  require('telescope').setup{
    defaults = {
      file_ignore_patterns = { "node_modules/*", "vendor/*" },
      initial_mode = "normal",
      },
    pickers = {
      buffers = {
        show_all_buffers = true,
        ignore_current_buffer = true,
        sort_lastused = true,
        mappings = {
          i = {
            ["<c-d>"] = "delete_buffer",
            },
          n = {
            ["<c-d>"] = "delete_buffer",
            }
          }
        }
      }
    }
EOF
endif
