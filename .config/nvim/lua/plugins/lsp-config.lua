return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "mason-org/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          -- "jdtls",
          "ts_ls",
          "bashls",
          "tailwindcss",
          "cssls",
          "ts_ls",
          "svelte",
        },
      })
    end,
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    config = function()
      require("mason-nvim-dap").setup({
        ensure_installed = { "java-debug-adapter", "java-test" },
        automatic_installation = true,
      })
    end,
  },

  {
    "mfussenegger/nvim-jdtls",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
  },
  "neovim/nvim-lspconfig",
  {
    config = function()
      local lspconfig = require("lspconfig")
      local keymap = vim.keymap
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })

      lspconfig.tsserver.setup({
        capabilities = capabilities,
        filetypes = {
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
        },
      })

      lspconfig.svelte.setup({
        capabilities = capabilities,
      })

      --keymaps
      keymap.set("n", "<S-k>", vim.lsp.buf.hover)
      keymap.set("n", "<leader>cD", vim.lsp.buf.declaration, { desc = "GOTO declaration" })
      keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = "GOTO Definition" })
      keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })

      keymap.set("n", "<leader>cr", require("telescope.builtin").lsp_references, { desc = "[G]oto Goto [R]eferences" })
      keymap.set(
        "n",
        "<leader>ci",
        require("telescope.builtin").lsp_implementations,
        { desc = "[C]ode goto [I]mplementations" }
      )
      keymap.set({ "n", "v" }, "<leader>cR", vim.lsp.buf.rename, { desc = "[C]ode [R]ename" })
    end,
  },
}
