return {
  {
    "echasnovski/mini.files",
    version = false,
    config = function()
      require("mini.files").setup({
        -- Custom key mappings inside the file explorer
        mappings = {
          close = "q",  -- Close the explorer
          go_in = "l",  -- Open file/enter directory
          go_in_plus = "L", -- Open in new window/tab
          go_out = "h", -- Go to parent directory
          go_out_plus = "H", -- Go to root/home
          mark_goto = "'", -- Jump to bookmark
          mark_set = "m", -- Set bookmark
          reset = "<BS>", -- Reset explorer
          reveal_cwd = "@", -- Reveal current working directory
          show_help = "g?", -- Show help
          synchronize = "=", -- Apply changes (create, delete, etc.)
          trim_left = "<", -- Shrink left
          trim_right = ">", -- Shrink right
        },
        options = {
          permanent_delete = true,
          use_as_default_explorer = true,
        },
        windows = {
          preview = true, -- Show preview of file/directory under cursor
          width_focus = 40,
          width_nofocus = 15,
          width_preview = 30,
        },
      })

      -- Set keymaps to open mini.files
      vim.keymap.set("n", "<leader>m", function()
        require("mini.files").open()
      end, { desc = "Open file explorer" })

      -- Optional: Add keymap to open explorer at current file
      vim.keymap.set("n", "<leader>M", function()
        require("mini.files").open(vim.api.nvim_buf_get_name(0))
      end, { desc = "Open explorer at current file" })
    end,
  },
}
