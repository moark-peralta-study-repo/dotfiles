-- lua/plugins/lsp.lu
-- lua/plugins/lsp.lua
return {
  -- mason.nvim: manage external tools
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "luacheck",
        "shellcheck",
        "shfmt",
        "tailwindcss-language-server",
        "typescript-language-server",
        "css-lsp",
        "jdtls",
      })
    end,
  },

  -- nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = true },
      servers = {
        cssls = {},
        html = {},
        tailwindcss = {
          root_dir = require("lspconfig.util").root_pattern(".git"),
        },
        tsserver = {
          root_dir = require("lspconfig.util").root_pattern(".git"),
          single_file_support = false,
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "literal",
                includeInlayFunctionParameterTypeHints = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayFunctionParameterTypeHints = true,
              },
            },
          },
        },
        lua_ls = {
          single_file_support = true,
          settings = {
            Lua = {
              workspace = { checkThirdParty = false },
              format = { enable = false },
            },
          },
        },
      },
    },
  },

  -- nvim-cmp with emoji
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
      opts.mapping = vim.tbl_extend("force", opts.mapping or {}, {
        ["<CR>"] = require("cmp").mapping.confirm({ select = true }),
      })
    end,
  },

  -- lspsaga.nvim: UI for code actions, hover, finder, rename
  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lspsaga").setup({
        code_action = {
          num_shortcut = true,
          keys = { quit = "q", exec = "<CR>" },
        },
        lightbulb = { enable = true },
        hover = { max_width = 80 },
      })

      -- Keymaps like IntelliJ
      vim.keymap.set("n", "<A-CR>", "<cmd>Lspsaga code_action<CR>", { silent = true, desc = "Code Action (Alt+Enter)" })
      vim.keymap.set("v", "<A-CR>", "<cmd>Lspsaga range_code_action<CR>", { silent = true })
      vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true, desc = "Hover Docs" })
      vim.keymap.set("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", { silent = true, desc = "References / Definitions" })
      vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { silent = true, desc = "Rename Symbol" })
    end,
  },

  -- nvim-jdtls: Java LSP with auto attach
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    config = function()
      local jdtls = require("jdtls")

      local function start_jdtls()
        local root = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" })
        if root == "" then
          return
        end

        local project_name = vim.fn.fnamemodify(root, ":p:h:t")
        local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. project_name

        local config = {
          cmd = { "jdtls", "-data", workspace_dir },
          root_dir = root,
          settings = { java = {
            trace = { server = "off" },
          } },
          init_options = { bundles = {} },
          handlers = {
            ["language/status"] = function() end,
            ["$/progress"] = function() end,
          },
        }

        jdtls.start_or_attach(config)
      end

      -- Auto start/attach jdtls on opening Java files
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "java",
        callback = start_jdtls,
      })
    end,
  },
}
