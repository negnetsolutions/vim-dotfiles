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
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
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
            enable = true
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
    use({ "mhinz/vim-signify" })

    -- Text Expansion
    use({ "mattn/emmet-vim" })

    -- Tab UI
    use({ "mkitt/tabline.vim" })

    -- UI
    use({ "machakann/vim-highlightedyank" })
    use({
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        require("indent_blankline").setup {
          space_char_blankline = " ",
          show_current_context = true,
          show_current_context_start = true,
        }
      end
    })
    use({ "RRethy/vim-illuminate" })
    use({ "kyazdani42/nvim-web-devicons" })

    -- use({
    --   'williamboman/nvim-lsp-installer',
    --   config = function ()
    --     require("nvim-lsp-installer").setup {
    --       ensure_installed = { "intelephense", "sumneko_lua" }
    --     }
    --
    --   end
    -- })
    --
    -- use({
    --   'neovim/nvim-lspconfig',
    --   requires = {
    --     'williamboman/nvim-lsp-installer',
    --   },
    --   config = function ()
    --
          -- vim.cmd("nmap ,t :Telescope lsp_document_symbols<CR>")
    --     -- Mappings.
    --     -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    --     local opts = { noremap=true, silent=true }
    --     vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    --     vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    --     vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    --
    --     -- Use an on_attach function to only map the following keys
    --     -- after the language server attaches to the current buffer
    --     local on_attach = function(client, bufnr)
    --       -- Enable completion triggered by <c-x><c-o>
    --       vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    --
    --       -- Mappings.
    --       -- See `:help vim.lsp.*` for documentation on any of the below functions
    --       vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    --       vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    --       vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    --       vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    --       vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    --       vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    --       vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    --       vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    --       vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    --     end
    --
    --     local diagnostics = function()
    --       local sign = function(opts)
    --         vim.fn.sign_define(opts.name, {
    --           texthl = opts.name,
    --           text = opts.text,
    --           numhl = ''
    --         })
    --       end
    --
    --       local icon = {
    --         error = '✘',
    --         warn = '▲',
    --         hint = '⚑',
    --         info = ''
    --       }
    --
    --       sign({name = 'DiagnosticSignError', text = icon.error})
    --       sign({name = 'DiagnosticSignWarn', text = icon.warn})
    --       sign({name = 'DiagnosticSignHint', text = icon.hint})
    --       sign({name = 'DiagnosticSignInfo', text = icon.info})
    --
    --       vim.diagnostic.config({
    --         virtual_text = false,
    --         signs = true,
    --         update_in_insert = false,
    --         underline = true,
    --         severity_sort = true,
    --         float = {
    --           focusable = false,
    --           style = 'minimal',
    --           border = 'rounded',
    --           source = 'always',
    --           header = '',
    --           prefix = '',
    --         },
    --       })
    --     end
    --
    --     -- Set diagnostics.
    --     diagnostics()
    --
    --     -- Use a loop to conveniently call 'setup' on multiple servers and
    --     -- map buffer local keybindings when the language server attaches
    --     local servers = { 'intelephense', 'sumneko_lua' }
    --     for _, lsp in pairs(servers) do
    --       require('lspconfig')[lsp].setup {
    --         on_attach = on_attach,
    --         flags = {
    --           -- This will be the default in neovim 0.7+
    --           debounce_text_changes = 150,
    --         }
    --       }
    --     end
    --
    --   end
    -- })

    -- use {
    --   'tzachar/cmp-tabnine',
    --   run = './install.sh',
    --   requires = 'hrsh7th/nvim-cmp'
    -- }

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
        lsp.setup()
        vim.cmd("nmap ,t :Telescope lsp_document_symbols<CR>")
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


    -- Autocomplete
    -- use {
    --   'neoclide/coc.nvim',
    --   requires = {
    --     "fannheyward/telescope-coc.nvim"
    --   },
    --   branch = 'release',
    --   run = ':CocUpdate',
    --   config = function()
    --     require('telescope').load_extension('coc')
    --
    --     vim.cmd("nmap <silent> gd <Plug>(coc-definition)")
    --     vim.cmd("nmap <silent> gr <Plug>(coc-references)")
    --     vim.cmd("nmap ,t :Telescope coc document_symbols<CR>")
    --     vim.cmd("let g:coc_user_config = {}")
    --     vim.cmd("let g:coc_user_config['coc.preferences.jumpCommand'] = ':drop'")
    --     vim.cmd("autocmd CursorHold * silent call CocActionAsync('highlight')")
    --   end
    -- }
    -- use {'yaegassy/coc-intelephense', run = 'yarn install --frozen-lockfile'}
    -- use {'neoclide/coc-tabnine', run = 'yarn install --frozen-lockfile'}
    

    -- Tmux
    use({ "tmux-plugins/vim-tmux-focus-events" })
    use({ "christoomey/vim-tmux-navigator" })

    if packer_bootstrap then
      require('packer').sync()
    end
end)
