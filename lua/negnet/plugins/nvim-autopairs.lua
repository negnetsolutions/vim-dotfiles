return  {
  "windwp/nvim-autopairs",
  config = function()
    require('nvim-autopairs').setup({
      disable_filetype = { "TelescopePrompt", "vim" },
      check_ts = true,
    })
  end,
  event = "InsertCharPre",
}
