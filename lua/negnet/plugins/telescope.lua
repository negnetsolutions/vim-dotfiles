return {
  "nvim-telescope/telescope.nvim",
  config = function()
    require('telescope').setup {
      defaults = {
        file_ignore_patterns = { "node_modules/*", "vendor/*", "react-dist/*" },
        initial_mode = "insert",
      },
      pickers = {
        find_files = {
          theme = "ivy",
        },
        buffers = {
          show_all_buffers = true,
          ignore_current_buffer = true,
          sort_lastused = true,
          previewer = false,
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


    vim.api.nvim_set_keymap('n', ',be', ':Telescope buffers<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', ',f', ':Telescope find_files<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', ',bd', ':Telescope diagnostics<CR>', { noremap = true, silent = true })
  end
}
