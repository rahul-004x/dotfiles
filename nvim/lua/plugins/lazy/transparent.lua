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
        -- Add blink.cmp highlight groups for transparency
        "BlinkCmpMenu",         -- Main completion menu
        "BlinkCmpLabel",        -- Completion item label
        "BlinkCmpLabelDetail",  -- Label detail
        "BlinkCmpLabelDescription", -- Label description
        "BlinkCmpKind",         -- Kind icon/text
        "BlinkCmpSource",       -- Source name
        -- Add Snacks highlight groups for transparency
        "SnacksNormal",
        "SnacksNormalNC",
        "SnacksBackdrop",
        "SnacksNotifierInfo",
        "SnacksNotifierWarn",
        "SnacksNotifierError",
        "SnacksNotifierDebug",
        "SnacksNotifierTrace",
        -- Add mini.files highlight groups for transparency
        "MiniFilesBorder",
        "MiniFilesBorderModified",
        "MiniFilesNormal",
        "MiniFilesTitle",
        "MiniFilesTitleFocused",
        -- Add diagnostic float border for transparency
        "DiagnosticFloatingError",
        "DiagnosticFloatingWarn",
        "DiagnosticFloatingInfo",
        "DiagnosticFloatingHint",
        "FloatBorder",
        -- Add command line highlight groups for transparency
        "MsgArea",          -- Command line area
        "MsgSeparator",     -- Command line separator
        "NoiceCmdlinePopup", -- Noice cmdline popup
        "NoiceCmdlinePopupBorder", -- Noice cmdline popup border
        "NoiceCmdlinePopupBorderSearch", -- Noice cmdline popup border (search)
        "StatusLine",       -- Status line
        "StatusLineNC",     -- Non-current status line
        "WinSeparator",     -- Window separator
        "VertSplit",        -- Vertical split
      },
      exclude_groups = {
        -- Keep borders and scrollbars visible
        "BlinkCmpMenuBorder",  -- Menu border
        "BlinkCmpScrollBarThumb", -- Scrollbar
        "BlinkCmpScrollBarGutter", -- Scrollbar gutter
        "BlinkCmpMenuSelection", -- Selected item background
        "SnacksBorder",        -- Snacks borders
        "SnacksPickerBorder",
        "SnacksPickerCursor",
        "MiniFilesCursorLine",
        "CursorLine",
      },                       -- Groups you don't want to clear
    })

    -- Clear all highlight groups that start with "NeoTree"
    require("transparent").clear_prefix("NeoTree")
    -- Clear all highlight groups that start with "BlinkCmp"
    require("transparent").clear_prefix("BlinkCmp")
    -- Clear all highlight groups that start with "MiniFiles"
    -- require("transparent").clear_prefix("MiniFiles")
    -- Clear all highlight groups that start with "Noice"
    require("transparent").clear_prefix("Noice")
  end,
}
