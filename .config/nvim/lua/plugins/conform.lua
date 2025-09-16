return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
    },
    -- Force Conform to use system stylua
    formatters = {
      stylua = {
        command = "/run/current-system/sw/bin/stylua", -- system binary in PATH from NixOS
      },
    },
  },
}

