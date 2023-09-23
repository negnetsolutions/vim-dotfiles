return  {
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
}
