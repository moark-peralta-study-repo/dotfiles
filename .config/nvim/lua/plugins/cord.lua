return {
  "vyfor/cord.nvim",
  build = ":Cord update", -- auto-fetch RPC binary
  config = function()
    require("cord").setup({
      text = {
        editing = "Editing Tite", -- %s = filename
        workspace = "Workspace: Tite",
      },
      idle = {
        enable = true,
        timeout = 300000, -- 5 min idle
      },
      assets = {
        neovim = { name = "Neovim", image = "neovim" },
      },
    })
  end,
}
