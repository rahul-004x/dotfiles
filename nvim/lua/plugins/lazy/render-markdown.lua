-- File: lua/plugins/render-markdown.lua

return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "echasnovski/mini.nvim", -- or use 'echasnovski/mini.icons' or 'nvim-tree/nvim-web-devicons'
  },
  opts = {
    -- Enable markdown rendering by default
    enabled = true,
    -- Only render in normal, command, and terminal modes
    render_modes = { "n", "c", "t" },
    -- Maximum file size to render (in MB)
    max_file_size = 10.0,
    -- Enable latex rendering
    latex = { enabled = true },
    -- You can customize more options here as needed
  },
  config = function(_, opts)
    require("render-markdown").setup(opts)

    -- Keybindings
    local map = vim.keymap.set
    -- Toggle render-markdown globally
    map("n", "<leader>mt", function()
      require("render-markdown").toggle()
    end, { desc = "Toggle RenderMarkdown (global)" })

    -- Toggle render-markdown for current buffer
    map("n", "<leader>mb", function()
      require("render-markdown").buf_toggle()
    end, { desc = "Toggle RenderMarkdown (buffer)" })

    -- Expand anti-conceal margin
    map("n", "<leader>me", function()
      require("render-markdown").expand()
    end, { desc = "Expand RenderMarkdown anti-conceal" })

    -- Contract anti-conceal margin
    map("n", "<leader>mc", function()
      require("render-markdown").contract()
    end, { desc = "Contract RenderMarkdown anti-conceal" })

    -- Open plugin log
    map("n", "<leader>ml", function()
      require("render-markdown").log()
    end, { desc = "Open RenderMarkdown log" })

    -- Print plugin config diff
    map("n", "<leader>md", function()
      require("render-markdown").config()
    end, { desc = "Show RenderMarkdown config diff" })
  end,
  ft = { "markdown" }, -- lazy-load for markdown files
}
