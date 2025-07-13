-- Add this to your lazy.nvim plugin list
return {
  "windwp/nvim-ts-autotag",
  event = { "BufReadPre", "BufNewFile" }, -- Lazy load on file open
  opts = {
    enable_close = true,
    enable_rename = true,
    enable_close_on_slash = false,
  },
  config = function(_, opts)
    require("nvim-ts-autotag").setup(opts)
  end,
}
