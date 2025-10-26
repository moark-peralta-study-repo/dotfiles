return {
  {
    "nvim-treesitter/nvim-treesitter",
    tag = "v0.9.1",
    opts = {
      ensure_installed = {
        "javascript",
        "typescript",
        "tsx",
        "css",
        "scss",
        "lua",
        "json",
        "graphql",
        "http",
        "sql",
        "vim",
        "gitignore",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = { "BufWrite", "CursorHold" },
      },
    },
  },
}
