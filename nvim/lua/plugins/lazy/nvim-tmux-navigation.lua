return {
  "alexghergh/nvim-tmux-navigation",
  keys = {
    { "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", desc = "Navigate left" },
    { "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", desc = "Navigate down" },
    { "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", desc = "Navigate up" },
    { "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", desc = "Navigate right" },
  },
  config = function()
    require("nvim-tmux-navigation").setup({})
  end,
}
