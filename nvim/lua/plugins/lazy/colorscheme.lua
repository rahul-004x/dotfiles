return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    opts = {
      integrations = { blink_cmp = true },
    },
    -- config = function()
    --   vim.cmd.colorscheme("catppuccin-mocha")
    -- end,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      integrations = { blink_cmp = true },
    },
    config = function()
      vim.cmd.colorscheme("kanagawa-wave")
    end,
  },
}
