require("lualine").setup({
  sections = {
    lualine_z = {
      {
        require("opencode").statusline,
      },
    },
    lualine_c = {
        {
            "filename",
            path = 1,
        }
    }
  }
})
