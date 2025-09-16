local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "x", '"_x')
-- Increment / Decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-a>")

-- File Explorer
keymap.set("n", "<Leader>f", ":NvimTreeFindFile<Return>", opts)
keymap.set("n", "<A-1>", ":NvimTreeToggle<Return>", opts)

-- Delete a word backwards
keymap.set("n", "dw", "vb_d")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Jumplist
keymap.set("n", "te", "tabedit", opts)
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- Split Window
keymap.set("n", "<Leader>ws", ":split<Return>", opts)
keymap.set("n", "<Leader>wv", ":vsplit<Return>", opts)
keymap.set("n", "<Leader>wu", ":only<Return>", opts)

-- Move Window
keymap.set("n", "<C-h>", "<Cmd>TmuxNavigateLeft<CR>", opts)
keymap.set("n", "<C-j>", "<Cmd>TmuxNavigateDown<CR>", opts)
keymap.set("n", "<C-k>", "<Cmd>TmuxNavigateUp<CR>", opts)
keymap.set("n", "<C-l>", "<Cmd>TmuxNavigateRight<CR>", opts)

-- Move Buffers
for i = 1, 9 do
  keymap.set("n", "<leader>" .. i, function()
    require("bufferline").go_to_buffer(i, true)
  end, { desc = "Go to buffer " .. i })
end

-- Cycle through buffers
keymap.set("n", "<Tab>", ":bnext<CR>", opts)
keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)

-- Close Buffers
keymap.set("n", "<leader>w", ":bdelete<CR>", opts)

-- nohlsearch
keymap.set("n", "<Leader>n", ":nohlsearch<CR>", opts)

-- Move lines up and down
-- keymap.set("n", "<A-k>", ":m .-2<CR>==", opts)
-- keymap.set("n", "<A-j>", ":m .+1<CR>==", opts)

--Comments
keymap.set("n", "<leader>c", function()
  require("Comment.api").toggle.linewise.current()
end)
keymap.set("v", "<leader>c", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")

-- Trouble.nvim for diagnostics (errors)
keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>")
keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>")
keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>")
keymap.set("n", "<leader>xp", vim.diagnostic.goto_prev)
keymap.set("n", "<leader>xn", vim.diagnostic.goto_next)
