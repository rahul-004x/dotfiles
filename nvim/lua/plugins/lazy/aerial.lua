return {
  "stevearc/aerial.nvim",
  opts = {},
  -- Optional dependencies for better experience
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("aerial").setup({
      -- Example: set up keymaps when aerial attaches to a buffer
      on_attach = function(bufnr)
        vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
        vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
      end,
    })
    -- Keymap to toggle aerial window
    vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
  end,
}
