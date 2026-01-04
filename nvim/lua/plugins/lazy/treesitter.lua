return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "elixir",
        "javascript",
        "html",
        "python",
        "typescript",
        "tsx",
        "css",
        "yaml",
        "toml",
        "json",
        "dockerfile",
        "ini",
        "prisma",
        "sql",
        "java",
        "regex",
        "bash"
      },
      sync_install = false,
      auto_install = false,
      ignore_install = {},
      modules = {},
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
