vim.pack.add({ "https://github.com/rachartier/tiny-cmdline.nvim" })

vim.o.cmdheight = 0
require("tiny-cmdline").setup({
  position = {
    y = "35%",
  },
  on_reposition = require("tiny-cmdline").adapters.blink,
})
