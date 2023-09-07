local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Add neo-tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
      -- Unless you are still migrating, remove the deprecated commands from v1.x
      vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

      require("neo-tree").setup({
        source_selector = {
          winbar = false,
          statusline = false
        },
        filesystem = {
          hijack_netrw_behavior = "open_current",
        }
      })

      vim.cmd([[nnoremap \ :Neotree reveal=true toggle<cr>]])
    end
  },

  -- Text manipulation
  { "tpope/vim-surround" },
  { "tpope/vim-repeat" },
  { "godlygeek/tabular" },
  {
    "sickill/vim-pasta",
    config = function()
      vim.g.pasta_disabled_filetypes = { "netrw", "python", "coffee", "markdown", "yaml", "slim" }
    end
  },

  { "Numkil/ag.nvim" },
  -- Telescope
  { "nvim-lua/plenary.nvim" },

  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require('telescope').setup {
        defaults = {
          file_ignore_patterns = { "node_modules/*", "vendor/*" },
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
  },

  -- Commenting
  {
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
  },

  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },

  -- Language
  { "lumiliet/vim-twig" },

  -- Auto Documentation.
  {
    "danymat/neogen",
    config = function()
      require('neogen').setup {
        -- snippet_engine = "luasnip",
        input_after_comment = true,
      }
    end,
    dependencies = "nvim-treesitter/nvim-treesitter",
    -- Uncomment next line if you want to follow only stable versions
    -- tag = "*"
  },

  {
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
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ':TSUpdate',
    config = function()
      require 'nvim-treesitter.configs'.setup {
        -- A list of parser names, or "all"
        ensure_installed = { "lua", "php", "javascript", "scss", "css", "html", "bash", "vim" },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        indent = {
          enable = true,
          disable = { "css", "scss", "lua" }
        },

        autopairs = {
          enable = true,
        },
        incremental_selection = { enable = true },
        textobjects = { enable = true },

        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        },

        highlight = {
          -- `false` will disable the whole extension
          enable = true,

          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },
      }
      -- Folding
      vim.o.foldmethod = "expr"
      vim.o.foldexpr = "nvim_treesitter#foldexpr()"
    end
  },

  -- Autoclosing
  {
    "windwp/nvim-autopairs",
    config = function()
      require('nvim-autopairs').setup({
        disable_filetype = { "TelescopePrompt", "vim" },
        check_ts = true,
      })
    end,
    event = "InsertCharPre",
  },

  -- Linting.
  { "editorconfig/editorconfig-vim" },
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {},
    config = function()
      require("null-ls").setup({
        sources = {
          require("null-ls").builtins.diagnostics.eslint,
          require("null-ls").builtins.completion.spell,
          require("null-ls").builtins.diagnostics.phpcs,
          require("null-ls").builtins.formatting.phpcbf,
          -- require("null-ls").builtins.diagnostics.stylelint,
          require("null-ls").builtins.formatting.prettier,
        },
      })
    end
  },
  {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup {
        auto_close = true,
        auto_open = false
      }
    end
  },

  -- Git
  {
    "zakj/vim-showmarks",
    config = function()
      vim.g.showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXY"
    end
  },
  { "tpope/vim-fugitive" },
  { "junegunn/gv.vim" },
  { "will133/vim-dirdiff" },

  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        signs = {
          add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
          change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
          delete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
          topdelete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
          changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
        },
        signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
        numhl = true,      -- Toggle with `:Gitsigns toggle_numhl`
        linehl = false,    -- Toggle with `:Gitsigns toggle_linehl`
        word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir = {
          interval = 1000,
          follow_files = true,
        },
        attach_to_untracked = true,
        current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
          delay = 1000,
          ignore_whitespace = false,
        },
        current_line_blame_formatter_opts = {
          relative_time = false,
        },
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        max_file_length = 40000,
        preview_config = {
          -- Options passed to nvim_open_win
          border = "single",
          style = "minimal",
          relative = "cursor",
          row = 0,
          col = 1,
        },
        yadm = {
          enable = false,
        },
      }
    end
  },

  -- Text Expansion
  { "mattn/emmet-vim" },

  -- Tab UI
  { "mkitt/tabline.vim" },

  -- UI
  { "machakann/vim-highlightedyank" },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      vim.g.indent_blankline_use_treesitter = true
      require("indent_blankline").setup {
        space_char_blankline = " ",
        show_current_context = true,
        show_current_context_start = true,
      }
    end
  },
  { "RRethy/vim-illuminate" },
  { "kyazdani42/nvim-web-devicons" },

  {
    'codota/tabnine-nvim',
    build = './dl_binaries.sh',
    config = function()
      require('tabnine').setup({
        disable_auto_comment = false,
        accept_keymap = "<C-n>",
        dismiss_keymap = "<C-]>",
        debounce_ms = 800,
        suggestion_color = { gui = "#808080", cterm = 244 },
        exclude_filetypes = { "TelescopePrompt" },
        log_file_path = nil, -- absolute path to Tabnine log file
      })
    end
  },

  {
    'rcarriga/nvim-notify',
    config = function()
      vim.notify = require('notify')
    end
  },

  {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'SmiteshP/nvim-navic' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    },
    config = function()
      local lsp = require('lsp-zero')
      local navic = require("nvim-navic")

      lsp.preset('recommended')

      lsp.set_preferences({
        manage_nvim_cmp = false,
        set_lsp_keymaps = false
      })

      lsp.on_attach(function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({
                filter = function(client1) return client1.name ~= "intelephense" end,
                bufnr = bufnr,
              })
            end,
          })
        end


        local function has_value(tab, val)
          for index, value in ipairs(tab) do
            if value == val then
              return true
            end
          end

          return false
        end

        local skipNavicLsps = { "null-ls", "ltex", "cssls", "eslint", "html" }

        if has_value(skipNavicLsps, client.name) == false then
          navic.attach(client, bufnr)
        end

        local fmt = function(cmd) return function(str) return cmd:format(str) end end
        local map = function(m, lhs, rhs)
          local opts = { noremap = true, silent = true }
          vim.api.nvim_buf_set_keymap(bufnr, m, lhs, rhs, opts)
        end

        local lsp_map = fmt('<cmd>lua vim.lsp.%s<cr>')
        local diagnostic = fmt('<cmd>lua vim.diagnostic.%s<cr>')

        map('n', 'K', lsp_map 'buf.hover()')
        map('n', 'gd', lsp_map 'buf.definition()')
        map('n', 'gD', lsp_map 'buf.declaration()')
        map('n', 'gi', lsp_map 'buf.implementation()')
        map('n', 'go', lsp_map 'buf.type_definition()')
        map('n', 'gr', lsp_map 'buf.references()')
        map('n', '<F2>', lsp_map 'buf.rename()')
        map('n', '<F4>', lsp_map 'buf.code_action()')
        map('x', '<F4>', lsp_map 'buf.range_code_action()')

        map('n', 'gl', diagnostic 'open_float()')
        map('n', '[d', diagnostic 'goto_prev()')
        map('n', ']d', diagnostic 'goto_next()')
      end)

      require('lspconfig').lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = { globals = { 'vim', 'augroup' } }
          },
        }
      })

      require('lspconfig').intelephense.setup({
        settings = {
          intelephense = {
            files = {
              exclude = { "**/phpstan/resultCache.php", "**/.git/**", "**/.svn/**", "**/.hg/**", "**/CVS/**",
                "**/.DS_Store/**", "**/node_modules/**", "**/bower_components/**", "**/vendor/**/{Tests,tests}/**",
                "**/.history/**", "**/vendor/**/vendor/**" }
            },
          },
        }
      })

      lsp.setup()

      vim.api.nvim_set_keymap('n', ',t', ':Telescope lsp_document_symbols<CR>', { noremap = true, silent = true })

      require('cmp_config')
    end
  },

  -- Theme.
  {
    "EdenEast/nightfox.nvim",
    config = function()
      require('nightfox').setup({
        options = {
          -- Compiled file's destination location
          compile_path = vim.fn.stdpath("cache") .. "/nightfox",
          compile_file_suffix = "_compiled", -- Compiled file suffix
          transparent = false,               -- Disable setting background
          terminal_colors = true,            -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
          dim_inactive = true,               -- Non focused panes set to alternative background
          styles = {
            -- Style to be applied to different syntax groups
            comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
            conditionals = "NONE",
            constants = "NONE",
            functions = "NONE",
            keywords = "NONE",
            numbers = "NONE",
            operators = "NONE",
            strings = "NONE",
            types = "NONE",
            variables = "NONE",
          },
          inverse = {
            -- Inverse highlight for different types
            match_paren = false,
            visual = false,
            search = false,
          },
        }
      })
      vim.cmd("colorscheme nightfox")
    end
  },

  -- Status Line
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      local navic = require("nvim-navic")
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = {},
          always_divide_middle = true,
          globalstatus = false,
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = {
            'filename', { navic.get_location, cond = navic.is_available },
          },
          lualine_x = { 'encoding', 'fileformat', 'filetype', 'tabnine' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' }
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        extensions = {}
      }
    end
  },


  -- Tmux
  { "tmux-plugins/vim-tmux-focus-events" },
  { "christoomey/vim-tmux-navigator" },
})
