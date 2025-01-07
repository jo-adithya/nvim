local M = {}

M.theme = function()
  local colors = require("tokyonight.colors").setup()
  local hl = {}

  hl.normal = {
    a = { fg = colors.blue },
    b = { fg = colors.green },
    c = { fg = "b9b1d6" },
  }

  hl.insert = {
    a = { fg = colors.green },
    b = { fg = colors.yellow },
  }

  hl.command = {
    a = { fg = colors.yellow },
    b = { fg = colors.magenta },
  }

  hl.visual = {
    a = { fg = colors.magenta },
    b = { fg = colors.red },
  }

  hl.replace = {
    a = { fg = colors.red },
    b = { fg = colors.blue },
  }

  hl.terminal = {
    a = { fg = colors.green1 },
    b = { fg = colors.blue1 },
  }

  hl.inactive = {
    a = { fg = colors.fg_gutter },
    b = { fg = colors.fg_gutter },
  }

  for _, mode in pairs(hl) do
    mode.a.gui = "bold"
  end

  return hl
end

return M
