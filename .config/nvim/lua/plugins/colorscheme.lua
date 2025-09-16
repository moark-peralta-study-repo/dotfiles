return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000, -- load before all the other start plugins
    config = function()
      require("gruvbox").setup({
        -- bold = true,
        terminal_colors = true,
        transparent_mode = true,
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          methods = true,
          emphasis = true,
          operators = true,
          comments = true,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        inverse = true,
        contrast = "hard", -- "hard" | "soft" | ""
      })

      -- set colorscheme
      vim.o.background = "dark" -- or "light" if you prefer
      vim.cmd.colorscheme("gruvbox")
    end,
  },
}
