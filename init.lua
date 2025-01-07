-- bootstrap lazy.nvim, LazyVim and your plugins

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config.lazy")

vim.opt.showtabline = 1
vim.o.winblend = 0
