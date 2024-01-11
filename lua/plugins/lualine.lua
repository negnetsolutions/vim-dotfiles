return {
  "nvim-lualine/lualine.nvim",
  opts = {
    sections = {
      lualine_y = {
        { "encoding" },
        { "fileformat" },
        { "filetype" },
        { "progress", separator = " ", padding = { left = 1, right = 0 } },
        { "location", padding = { left = 0, right = 1 } },
      },
      lualine_z = {
        { "tabnine" },
        function()
          return " " .. os.date("%R")
        end,
      },
    },
  },
}
