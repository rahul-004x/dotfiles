-- plugins/transparent.lua

---@type LazyPluginSpec
return {
  "xiyaowong/transparent.nvim",
  -- It's recommended NOT to lazy-load this plugin
  lazy = false,
  priority = 1000, -- Load early, before colorschemes
  config = function()
    require("transparent").setup({
      extra_groups = {
        "NormalFloat", -- For floating windows
        "NvimTreeNormal", -- For NvimTree
        -- Add Neo-tree highlight groups for transparency
        "NeoTreeNormal", -- Main Neo-tree window
        "NeoTreeNormalNC", -- Non-current Neo-tree window
        "NeoTreeEndOfBuffer",
        "NeoTreeTabInactive",
        "NeoTreeTabActive",
        "NeoTreeTabSeparatorInactive",
        "NeoTreeTabSeparatorActive",
        "NeoTreeVertSplit",
      },
      exclude_groups = {}, -- Groups you don't want to clear
    })

    -- Clear all highlight groups that start with "NeoTree"
    require("transparent").clear_prefix("NeoTree")
  end,
}
