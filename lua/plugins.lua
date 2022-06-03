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

    -- use {
    --   'tzachar/cmp-tabnine',
    --   run = './install.sh',
    --   requires = 'hrsh7th/nvim-cmp'
    -- }

    use {
      "lazytanuki/nvim-mapper",
      config = function() require("nvim-mapper").setup{} end,
      before = "telescope.nvim"
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
          manage_nvim_cmp = false
        })
        lsp.setup()
        vim.cmd("nmap ,t :Telescope lsp_document_symbols<CR>")

        local cmp = require('cmp')

        vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

        local cmp_select_opts = {behavior = cmp.SelectBehavior.Select}
        local util = {}

        local luasnip = require('luasnip')

        luasnip.config.set_config({
          region_check_events = 'InsertEnter',
          delete_check_events = 'InsertLeave'
        })

        require('luasnip.loaders.from_vscode').load()

        util.check_back_space = function()
          local col = vim.fn.col('.') - 1
          if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
            return true
          else
            return false
          end
        end


        local cmp_config = {
          completion = {
            completeopt = 'menu,menuone,noinsert'
          },
          snippet = {
            expand = function(args)
              luasnip.lsp_expand(args.body)
            end,
          }, 
          sources = {
            {name = 'path'},
            {name = 'nvim_lsp', keyword_length = 3},
            {name = 'buffer', keyword_length = 3},
            {name = 'luasnip', keyword_length = 2},
          },
          window = {
            documentation = vim.tbl_deep_extend(
              'force',
              cmp.config.window.bordered(),
              {
                max_height = 15,
                max_width = 60,
              }
            )
          },
          formatting = {
            fields = {'abbr', 'menu', 'kind'},
            format = function(entry, item)
              local short_name = {
                nvim_lsp = 'LSP',
                nvim_lua = 'nvim'
              }

              local menu_name = short_name[entry.source.name] or entry.source.name

              item.menu = string.format('[%s]', menu_name)
              return item
            end,
          },
          mapping = {
            -- confirm selection
            ['<C-y>'] = cmp.mapping.confirm({select = true}),

            -- navigate items on the list
            ['<Up>'] = cmp.mapping.select_prev_item(cmp_select_opts),
            ['<Down>'] = cmp.mapping.select_next_item(cmp_select_opts),

            -- scroll up and down in the completion documentation
            ['<C-f>'] = cmp.mapping.scroll_docs(5),
            ['<C-u>'] = cmp.mapping.scroll_docs(-5),

            -- toggle completion
            ['<C-e>'] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.close()
                fallback()
              else
                cmp.complete()
              end
            end),

            -- go to next placeholder in the snippet
            ['<C-d>'] = cmp.mapping(function(fallback)
              if luasnip.jumpable(1) then
                luasnip.jump(1)
              else
                fallback()
              end
            end, {'i', 's'}),

            -- go to previous placeholder in the snippet
            ['<C-b>'] = cmp.mapping(function(fallback)
              if luasnip.jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end, {'i', 's'}),

            -- when menu is visible, navigate to next item
            -- when line is empty, insert a tab character
            -- else, activate completion
            ['<Tab>'] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item(cmp_select_opts)
              elseif util.check_back_space() then
                fallback()
              else
                cmp.complete()
              end
            end, {'i', 's'}),

            -- when menu is visible, navigate to previous item on list
            -- else, revert to default behavior
            ['<S-Tab>'] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item(cmp_select_opts)
              else
                fallback()
              end
            end, {'i', 's'}),
          }
        }

        cmp.setup(cmp_config)
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
