vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.g.background = "light"
vim.opt.guifont = "Cascadia Code"
vim.opt.guicursor = "n-v-c-i:block"

vim.opt.swapfile = false
vim.opt.autoread = true
vim.opt.updatetime = 250

-- Do not continue comments when pressing o/O or hitting Enter
vim.opt.formatoptions:remove({ "r", "o" })

-- Associate Dockerfile.* files with the dockerfile filetype
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "Dockerfile", "Dockerfile.*", "dockerfile", "dockerfile.*" },
  command = "set filetype=dockerfile",
})

-- <C-h/j/k/l> move between nvim windows, then herdr panes at the edge.
require("plugins.herdr_navigation").setup()

-- Copy to system clipboard
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')

-- Paste from system clipboard
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("v", "<leader>p", '"+p')

-- Insert-mode <C-j> exits insert; navigation (above) is normal/terminal mode only.
vim.keymap.set("i", "<C-j>", "<Esc>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.keymap.set("n", "<Esc>", ":noh<CR>", { noremap = true, silent = true })

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = true
-- vim.opt.signcolumn = "yes"

vim.keymap.set("n", "<leader>sr", function()
  local word = vim.fn.expand("<cword>")
  local replacement = vim.fn.input('Replace "' .. word .. '" by? ')
  if replacement == "" then
    return
  end
  vim.cmd("%s/\\v<" .. word .. ">/" .. replacement .. "/g")
end, { noremap = true, silent = true })

require("plugins.lazy_init")
