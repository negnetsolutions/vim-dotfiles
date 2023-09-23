return {
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
}
