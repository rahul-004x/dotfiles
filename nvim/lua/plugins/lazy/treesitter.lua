return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local languages = {
      "c", "lua", "vim", "vimdoc",
      "elixir", "javascript", "html", "python",
      "typescript", "tsx", "css", "yaml", "toml",
      "json", "dockerfile", "ini",
      "prisma", "sql", "java", "regex", "bash",
    }

    local already = require("nvim-treesitter.config").get_installed()
    local to_install = vim.iter(languages):filter(function(lang)
      return not vim.tbl_contains(already, lang)
    end):totable()

    -- Install missing parsers asynchronously (no blocking startup wait)
    if #to_install > 0 then
      require("nvim-treesitter").install(to_install)
    end

    vim.api.nvim_create_autocmd("FileType", {
      pattern = languages,
      callback = function()
        pcall(vim.treesitter.start)
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
