return {
  "nvim-lualine/lualine.nvim",
  opts = {
    sections = {
      lualine_z = {
        { "tabnine" },
        function()
          return " " .. os.date("%R")
        end,
      },
    },
  },
}
