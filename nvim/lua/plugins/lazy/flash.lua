-- init.lua
-- Neovim configuration for flash.nvim with keybindings as plugin definitions

-- Ensure you have a plugin manager like lazy.nvim or packer.nvim set up before this block

-- Plugin setup using lazy.nvim (recommended for modern Neovim)
return {
  "folke/flash.nvim",
  event = "VeryLazy",
  config = function()
    require("flash").setup({
      modes = {
        char = {
          enabled = false,
        },
      },
    })

    -- Keybindings for flash.nvim
    -- 's' to jump (normal, visual, operator-pending)
    vim.keymap.set({ "n", "x", "o" }, "s", function()
      require("flash").jump()
    end, { desc = "Flash Jump" })

    -- 'S' for Treesitter-powered jump (normal, visual, operator-pending)
    vim.keymap.set({ "n", "x", "o" }, "T", function()
      require("flash").treesitter()
    end, { desc = "Flash Treesitter" })

    -- 'r' for remote jump (operator-pending)
    vim.keymap.set({ "o" }, "r", function()
      require("flash").remote()
    end, { desc = "Flash Remote" })

    -- 'R' for Treesitter search (visual, operator-pending)
    vim.keymap.set({ "x", "o" }, "R", function()
      require("flash").treesitter_search()
    end, { desc = "Flash Treesitter Search" })

    -- Optional: Enhanced f/t/F/T motions (toggleable)
    -- Uncomment to enable enhanced motions
    -- require("flash").toggle()
  end,
}

-- If you use packer.nvim, replace the above with:
-- require("packer").startup(function(use)
--   use {
--     "folke/flash.nvim",
--     config = function()
--       require("flash").setup({})
--       -- (same keymap setup as above)
--     end
--   }
-- end)

-- Usage:
-- - Press 's' to jump to a location
-- - Press 'S' for Treesitter-based jump
-- - Use 'r' and 'R' for remote and Treesitter search modes

-- This file is self-contained and can be used as your main Neovim config or sourced from your main config.
