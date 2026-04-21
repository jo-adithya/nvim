vim.pack.add({ "https://github.com/olimorris/onedarkpro.nvim" })

-- Setup --

require("onedarkpro").setup({
  colors = {
    dark = {
      blue = "#82B0FA",
      cyan = "#9DE0D6",
      purple = "#C096FF",
    },
    light = {
      blue = "#4583ef",
      purple = "#9479e0",
      red = "#d12934",
      cyan = "#85d3c5",
      orange = "#a3431d",
      yellow = "#b57614",
      green = "#62a552",
      bg = "#ede6c2",
      line_number = "#a89984",
    },
  },
  styles = {
    comments = "italic",
    keywords = "bold,italic",
    functions = "bold,italic",
    conditionals = "bold,italic",
    operators = "bold",
    methods = "bold,italic",
  },
  options = {
    transparency = true,
  },
  highlights = {
    StatuslineNormal = { fg = "${blue}", italic = true, bold = true },
    StatuslineInsert = { fg = "${green}", italic = true, bold = true },
    StatuslineVisual = { fg = "${orange}", italic = true, bold = true },
    StatuslineCommand = { fg = "${purple}", italic = true, bold = true },
    StatuslineGit = { fg = "${purple}", italic = true, bold = true },
    StatuslineFileName = { fg = "${fg}", italic = true },
    Folded = { fg = "${cyan}", italic = true },
    -- Folded = { link = "Comment" },
    FoldColumn = { fg = "${line_number}", bg = "NONE" },
    ["@lsp.typemod.function.defaultLibrary"] = { fg = { dark = "#A6A8F5" } },
    ["@lsp.typemod.function.defaultLibrary.lua"] = { link = "@lsp.typemod.function.defaultLibrary" },
    WhichKeyIcon = { fg = "${cyan}", underline = false },
    FloatBorder = { fg = "${blue}", bold = true },
    CursorLine = { bg = "#333946" },
    CursorLineNr = { bg = "#333946", fg = "${purple}" },
    Visual = { bg = "#393570" },
  },
})

vim.cmd.colorscheme("onedark")
