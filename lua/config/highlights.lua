----------------------------------
--          Statusline          --
----------------------------------

--- @type CtpColors<string>
local palette = require("catppuccin.palettes").get_palette()

vim.api.nvim_set_hl(0, "StatuslineNormal", { fg = palette.blue, italic = true, bold = true })
vim.api.nvim_set_hl(0, "StatuslineInsert", { fg = palette.green, italic = true, bold = true })
vim.api.nvim_set_hl(0, "StatuslineVisual", { fg = palette.peach, italic = true, bold = true })
vim.api.nvim_set_hl(0, "StatuslineCommand", { fg = palette.mauve, italic = true, bold = true })
vim.api.nvim_set_hl(0, "StatuslineGit", { fg = palette.mauve, italic = true, bold = true })
vim.api.nvim_set_hl(0, "StatuslineFileName", { fg = palette.text, italic = true })



