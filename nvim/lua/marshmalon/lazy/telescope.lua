return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = {
            "node_modules/.*",
            "%.git/.*",
          },
          find_command = { "fd", "--type", "f", "--hidden", "--no-ignore", "--exclude", ".git", "--exclude", "node_modules" },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-p>", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fh", function()
        builtin.find_files({ hidden = true, no_ignore = true })
      end, { desc = "Find all files including hidden" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      -- vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})

      require("telescope").load_extension("ui-select")
    end,
  },
}
