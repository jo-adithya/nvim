return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      flavour = "mocha",
      transparent_background = true,
      term_colors = true,
      styles = {
        comments = { "italic" },
        conditionals = { "italic", "bold" },
        functions = { "italic", "bold" },
        keywords = { "italic", "bold" },
        -- variables = { "bold" },
        booleans = { "bold" },
        fields = {},
      },
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        grug_far = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
        blink_cmp = true,
      },
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "storm",
      transparent = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true, bold = true },
        functions = { italic = true, bold = true },
        sidebars = "transparent",
        floats = "transparent",
      },
      lualine_bold = true,
      on_colors = function(colors)
        colors.bg_statusline = colors.none -- or "NONE"
      end,
      on_highlights = function(hl)
        hl.DiagnosticUnderlineWarn.undercurl = true
        hl.DiagnosticUnderlineError.undercurl = true
        hl.DiagnosticUnderlineInfo.undercurl = true
      end,
    },
  },
}
