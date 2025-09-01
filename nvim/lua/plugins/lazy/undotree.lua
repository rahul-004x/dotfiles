return {
  "mbbill/undotree",
  lazy = true,
  keys = {
    {
      "<leader>U",
      function()
        vim.cmd.UndotreeToggle()
      end,
      desc = "Toggle Undotree",
    },
  },
  config = true,
}
