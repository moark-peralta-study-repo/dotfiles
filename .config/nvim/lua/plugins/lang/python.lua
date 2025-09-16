-- Python LSP configuration for NixOS
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Type checking and completions
        pyright = {
          root_dir = require("lspconfig.util").root_pattern(
            ".git",
            "pyproject.toml",
            "setup.py",
            "setup.cfg",
            "requirements.txt"
          ),
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic",
                autoImportCompletions = true,
                diagnosticMode = "openFilesOnly", -- reduce duplicate warnings
              },
            },
          },
        },

        -- Python LSP Server with Ruff plugin for linting
        pylsp = {
          cmd = { "pylsp" }, -- ensure pylsp is installed (python-lsp-server)
          root_dir = require("lspconfig.util").root_pattern(
            ".git",
            "pyproject.toml",
            "setup.py",
            "setup.cfg",
            "requirements.txt"
          ),
          settings = {
            pylsp = {
              plugins = {
                ruff = {
                  enabled = true,
                  formatEnabled = true,
                  executable = "ruff", -- uses your nix-installed ruff
                  args = {}, -- optionally add '--config', 'ruff.toml'
                },
                pycodestyle = { enabled = false }, -- disable overlapping linters
                pylint = { enabled = false },
                mccabe = { enabled = false },
                pyflakes = { enabled = false },
              },
            },
          },
        },
      },
    },
  },
}
