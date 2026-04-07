vim.pack.add({"https://github.com/folke/which-key.nvim"})

-- Setup --

local wk = require("which-key")
wk.setup({
  preset = "modern",
  win = {
    height = { max = 0.4 },
    padding = { 0, 2 },
  },
  layout = {
    width = { max = 30 },
  },
  icons = {
    separator = " ",
    group = "  ",
    -- mappings = false,
    -- colors = false,
  },
})
wk.add({
  {
    "<leader>?",
    function()
      wk.show({ global = false })
    end,
    desc = "Buffer Local Keymaps",
  },
})
