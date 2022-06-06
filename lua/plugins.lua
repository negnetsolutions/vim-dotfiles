local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- bootstap
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
        "git",
        "clone",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    execute("packadd packer.nvim")
end

-- autocompile
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

require("packer").init({
    max_jobs = 50,
})

return require("packer").startup(function(use)
    use({ "wbthomason/packer.nvim" })

    -- Text manipulation
    use({ "tpope/vim-surround" })
    use({ "tpope/vim-repeat" })
    use({
      "sickill/vim-pasta",
      config = function()
        vim.g.pasta_disabled_filetypes = {"netrw","python", "coffee", "markdown", "yaml", "slim"}
      end
    })

    -- Telescope
    use({ "nvim-lua/plenary.nvim" })

    use({
      "nvim-telescope/telescope.nvim",
      config = function()
        require('telescope').setup{
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
    })

    use({ "lewis6991/impatient.nvim" })

    -- Commenting
    use({
      "terrortylor/nvim-comment",
      config = function()
        require('nvim_comment').setup({
          create_mappings = true,
          comment_empty = true
        })
        vim.api.nvim_set_keymap('n', '<leader>/', ':CommentToggle<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('v', '<leader>/', ':CommentToggle<CR>', { noremap = true, silent = true })
      end
    })
    use({
      "JoosepAlviste/nvim-ts-context-commentstring",
      requires = { 'nvim-treesitter/nvim-treesitter' },
      config = function()
        require'nvim-treesitter.configs'.setup {
          context_commentstring = {
            enable = true
          }
        }
      end
    })

    -- Language
    use({ "lumiliet/vim-twig" })

    use({
      "nvim-treesitter/nvim-treesitter",
      run = ':TSUpdate',
      config = function()
        require'nvim-treesitter.configs'.setup {
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
    })

    -- Autoclosing
    use({
      "windwp/nvim-autopairs",
      config = function()
        require('nvim-autopairs').setup({
          disable_filetype = { "TelescopePrompt" , "vim" },
          check_ts = true,
        })
      end,
      event = "InsertCharPre",
    })

    -- Linting.
    use({ "editorconfig/editorconfig-vim" })
    use({
	    "jose-elias-alvarez/null-ls.nvim",
	    config = function()
		    require("null-ls").setup({
			    sources = {
				    require("null-ls").builtins.diagnostics.eslint,
				    require("null-ls").builtins.completion.spell,
				    require("null-ls").builtins.diagnostics.phpcs,
				    require("null-ls").builtins.formatting.phpcbf,
				    require("null-ls").builtins.diagnostics.stylelint,
				    require("null-ls").builtins.formatting.prettier,
			    },
		    })
	    end
    })
    use({
	    "folke/trouble.nvim",
	    config = function() 
		    require("trouble").setup {
			    auto_close = true,
			    auto_open = false
		    }
	    end
    })

    -- Git
    use({
      "zakj/vim-showmarks",
      config = function()
        vim.g.showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXY"
      end
    })
    use({ "tpope/vim-fugitive" })
    use({ "junegunn/gv.vim" })
    use({ "will133/vim-dirdiff" })

    use {
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
          numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
          linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
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
    }

    -- Text Expansion
    use({ "mattn/emmet-vim" })

    -- Tab UI
    use({ "mkitt/tabline.vim" })

    -- UI
    use({ "machakann/vim-highlightedyank" })
    use({
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        vim.g.indent_blankline_use_treesitter = true
        require("indent_blankline").setup {
          space_char_blankline = " ",
          show_current_context = true,
          show_current_context_start = true,
        }
      end
    })
    use({ "RRethy/vim-illuminate" })
    use({ "kyazdani42/nvim-web-devicons" })

    use {
      'tzachar/cmp-tabnine',
      run = './install.sh',
      requires = 'hrsh7th/nvim-cmp',
      config = function()
        local tabnine = require('cmp_tabnine.config')
        tabnine:setup({
          max_lines = 1000;
          max_num_results = 20;
          sort = true;
          run_on_every_keystroke = true;
          snippet_placeholder = '..';
          ignored_file_types = { -- default is not to ignore
            -- uncomment to ignore in lua:
            -- lua = true
          };
          show_prediction_strength = false;
        })
      end
    }

    use {
      'VonHeikemen/lsp-zero.nvim',
      requires = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},
        {'williamboman/nvim-lsp-installer'},
    
        -- Autocompletion
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-path'},
        {'saadparwaiz1/cmp_luasnip'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/cmp-nvim-lua'},
    
        -- Snippets
        {'L3MON4D3/LuaSnip'},
        {'rafamadriz/friendly-snippets'},
      },
      config = function()
        local lsp = require('lsp-zero')
    
        lsp.preset('recommended')

        lsp.set_preferences({
          manage_nvim_cmp = false,
          set_lsp_keymaps = false
        })

        lsp.on_attach(function(client, bufnr)
          local fmt = function(cmd) return function(str) return cmd:format(str) end end
          local map = function(m, lhs, rhs)
            local opts = {noremap = true, silent = true}
            vim.api.nvim_buf_set_keymap(bufnr, m, lhs, rhs, opts)
          end

          local lsp = fmt('<cmd>lua vim.lsp.%s<cr>')
          local diagnostic = fmt('<cmd>lua vim.diagnostic.%s<cr>')

          map('n', 'K', lsp 'buf.hover()')
          map('n', 'gd', lsp 'buf.definition()')
          map('n', 'gD', lsp 'buf.declaration()')
          map('n', 'gi', lsp 'buf.implementation()')
          map('n', 'go', lsp 'buf.type_definition()')
          map('n', 'gr', lsp 'buf.references()')
          map('n', '<F2>', lsp 'buf.rename()')
          map('n', '<F4>', lsp 'buf.code_action()')
          map('x', '<F4>', lsp 'buf.range_code_action()')

          map('n', 'gl', diagnostic 'open_float()')
          map('n', '[d', diagnostic 'goto_prev()')
          map('n', ']d', diagnostic 'goto_next()')
        
        end)

        lsp.setup()
    
        vim.api.nvim_set_keymap('n', ',t', ':Telescope lsp_document_symbols<CR>', { noremap = true, silent = true })
    
        require('cmp_config')
      end
    }

    -- Theme.
    use({
      "EdenEast/nightfox.nvim",
      config = function()
        require('nightfox').setup({
          options = {
            -- Compiled file's destination location
            compile_path = vim.fn.stdpath("cache") .. "/nightfox",
            compile_file_suffix = "_compiled", -- Compiled file suffix
            transparent = false,    -- Disable setting background
            terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
            dim_inactive = true,   -- Non focused panes set to alternative background
            styles = {              -- Style to be applied to different syntax groups
              comments = "NONE",    -- Value is any valid attr-list value `:help attr-list`
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
            inverse = {             -- Inverse highlight for different types
              match_paren = false,
              visual = false,
              search = false,
            },
          }
        })
        vim.cmd("colorscheme nightfox")
        end
      })

    -- Status Line
    use({
      "nvim-lualine/lualine.nvim",
      config = function()
        require('lualine').setup {
          options = {
            icons_enabled = true,
            theme = 'auto',
            component_separators = { left = '', right = ''},
            section_separators = { left = '', right = ''},
            disabled_filetypes = {},
            always_divide_middle = true,
            globalstatus = false,
          },
          sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch', 'diff', 'diagnostics'},
            lualine_c = {'filename'},
            lualine_x = {'encoding', 'fileformat', 'filetype'},
            lualine_y = {'progress'},
            lualine_z = {'location'}
          },
          inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {'filename'},
            lualine_x = {'location'},
            lualine_y = {},
            lualine_z = {}
          },
          tabline = {},
          extensions = {}
        }
      end
    })


    -- Tmux
    use({ "tmux-plugins/vim-tmux-focus-events" })
    use({ "christoomey/vim-tmux-navigator" })

    if packer_bootstrap then
      require('packer').sync()
    end
end)
