return {
  "okuuva/auto-save.nvim",
  version = "^1.0.0",                      -- see https://devhints.io/semver, alternatively use '*' to use the latest tagged release
  cmd = "ASToggle",                        -- optional for lazy loading on command
  event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
  opts = {
    -- Each save runs conform format-on-save, LSP didSave and gitsigns;
    -- a longer debounce batches edits instead of saving after every change.
    debounce_delay = 2500,
  },
}
