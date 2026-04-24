vim.pack.add({ "https://github.com/olimorris/onedarkpro.nvim", "https://github.com/neanias/everforest-nvim" })

-- Setup --

function onedarkpro()
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
end

function everforest()
  require("everforest").setup({
    background = "medium",
    transparent_background_level = 2,
    italics = true,
    ui_contrast = "high",
    spell_foreground = true,
    show_eob = true,
    on_highlights = function(hl, palette)
      hl.StatuslineNormal = { fg = palette.blue, italic = true, bold = true }
      hl.StatuslineInsert = { fg = palette.green, italic = true, bold = true }
      hl.StatuslineVisual = { fg = palette.orange, italic = true, bold = true }
      hl.StatuslineCommand = { fg = palette.purple, italic = true, bold = true }
      hl.StatuslineGit = { fg = palette.purple, italic = true, bold = true }
      hl.StatuslineFileName = { fg = palette.fg, italic = true }
      hl.Folded = { fg = palette.purple, italic = true }
      -- hl.["@lsp.typemod.function.defaultLibrary"] = { fg = { dark = "#A6A8F5" } }
      -- hl.["@lsp.typemod.function.defaultLibrary.lua"] = { link = "@lsp.typemod.function.defaultLibrary" }
      hl.WhichKeyIcon = { fg = palette.aqua, underline = false }
      hl.FloatBorder = { fg = palette.blue, bg = "none", bold = true }
      hl.NormalFloat = { bg = "none" }
      hl.FloatTitle = { bg = "none", bold = true, italic = true }
      -- hl.CursorLine = { bg = "#333946" }
      hl.CursorLineNr = { fg = palette.orange }

      -- LSP
      hl["@keyword"] = { bold = true, italic = true, fg = palette.red }
      hl["@keyword.function"] = { bold = true, italic = true, fg = palette.red }
      hl["@lsp.type.keyword"] = { bold = true, italic = true, fg = palette.red }
    end,
    -- colours_override = function(palette) end,
  })
end

everforest()
vim.cmd.colorscheme("everforest")
