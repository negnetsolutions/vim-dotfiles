return {
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
}
