return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "windwp/nvim-ts-autotag",
    },

    build = ":TSUpdate",
    config = function()
      local ts_config = require("nvim-treesitter.configs")

      ts_config.setup({
        ensure_installed = {
          "vim",
          "vimdoc",
          "lua",
          "java",
          "javascript",
          "typescript",
          "html",
          "css",
          "json",
          "jsx",
          "tsx",
          "markdown",
          "markdown_inline",
          "gitignore",
        },
        highlight = { enable = true },
        autotag = { enable = true },
      })
    end,
  },
}
