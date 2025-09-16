return 
{
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("refactoring").setup({})

    -- Load telescope extension
    require("telescope").load_extension("refactoring")

    -- Keymap: open telescope refactor menu
    vim.keymap.set("v", "<leader>r", function()
      require("telescope").extensions.refactoring.refactors()
    end, { desc = "Refactor Menu" })

    -- Keymap: open telescope with rename included
    vim.keymap.set("n", "<leader>r", function()
      local actions = {
        { name = "Rename Symbol", action = function()
            vim.cmd("IncRename " .. vim.fn.expand("<cword>"))
          end },
      }

      -- add refactoring.nvim actions into telescope picker
      require("telescope.pickers").new({}, {
        prompt_title = "Refactor / Rename",
        finder = require("telescope.finders").new_table {
          results = vim.tbl_map(function(x) return x.name end, actions),
        },
        sorter = require("telescope.config").values.generic_sorter({}),
        attach_mappings = function(_, map)
          map("i", "<CR>", function(bufnr)
            local selection = require("telescope.actions.state").get_selected_entry(bufnr)
            require("telescope.actions").close(bufnr)

            for _, a in ipairs(actions) do
              if a.name == selection[1] then
                a.action()
              end
            end
          end)
          return true
        end,
      }):find()
    end, { desc = "Rename / Refactor Menu" })
  end,
}

