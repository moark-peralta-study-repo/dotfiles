return {
  "stevearc/conform.nvim",
  keys = {
    {
      "<leader>F",
      function()
        require("conform").format({
          async = true,
          lsp_fallback = true,
        })
      end,
      desc = "Format code",
    },
  },

  opts = {
    -- Formatters per filetype
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "biome" },
      typescript = { "biome" },
      typescriptreact = { "biome" },
      javascriptreact = { "biome" },
      html = { "biome" },
      json = { "biome" },
      css = { "biome" },
      java = { "google_java_format" },
    },

    -- Custom formatter definitions (optional)
    formatters = {
      stylua = {
        command = "stylua",
        args = {
          "--search-parent-directories",
          "--stdin-filepath",
          "$FILENAME",
          "-",
        },
      },
      biome = {
        command = "biome",
        args = { "format", "--stdin-file-path", "$FILENAME" },
        stdin = true,
      },
    },
  },
}
