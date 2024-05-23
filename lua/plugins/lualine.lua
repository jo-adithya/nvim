return {
  "nvim-lualine/lualine.nvim",
  optional = true,
  event = "VeryLazy",
  opts = function()
    local icons = require("lazyvim.config").icons
    return {
      options = {
        component_separators = { left = "  ", right = "  " },
        section_separators = { left = "", right = "" },
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha", "starter" } },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = { "filename" },
        lualine_x = {
          -- stylua: ignore
          {
            function() return "  " .. require("dap").status() end,
            cond = function () return package.loaded["dap"] and require("dap").status() ~= "" end,
            color = LazyVim.ui.fg("Debug"),
          },
          {
            "diff",
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
            },
            source = function()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end,
          },
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            sections = { "error", "warn", "info", "hint" },
            symbols = {
              error = icons.diagnostics.Error .. " ",
              hint = icons.diagnostics.Hint .. " ",
              info = icons.diagnostics.Info .. " ",
              warn = icons.diagnostics.Warn .. " ",
            },
            colored = true,
            update_in_insert = false,
            always_visible = false,
          },
          { "filetype", icon_only = true },
        },
        lualine_y = {},
        lualine_z = {},
      },
    }
  end,
}
