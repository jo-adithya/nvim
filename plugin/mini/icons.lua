vim.pack.add({"https://github.com/nvim-mini/mini.icons"})

-- Setup --

require("mini.icons").setup({
  default = {
    file = { glyph = "" },
    directory = { glyph = "" },
  },
  extension = {
    js = { glyph = "" },
    ipynb = { glyph = "" },
    jpg = { glyph = "" },
    png = { glyph = "" },
    pdf = { glyph = "" },
  },
})
require("mini.icons").mock_nvim_web_devicons()
