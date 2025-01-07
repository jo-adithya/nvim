local excluded_filetypes_array = {
  "lsp-installer",
  "lspinfo",
  "Outline",
  "lazy",
  "help",
  "packer",
  "netrw",
  "qf",
  "dbui",
  "Trouble",
  "fugitive",
  "floaterm",
  "spectre_panel",
  "spectre_panel_write",
  "checkhealth",
  "man",
  "dap-repl",
  "toggleterm",
  "neo-tree",
  "nvim-tree",
  "NvimTree",
  "ImportManager",
  "aerial",
}
local excluded_filetypes_table = {}
for _, value in ipairs(excluded_filetypes_array) do
  excluded_filetypes_table[value] = 1
end

return {
  "nvim-lualine/lualine.nvim", -- Neovim status line
  dependencies = {
    "SmiteshP/nvim-navic",
    "echasnovski/mini.icons",
    -- "onsails/lspkind-nvim",
  },
  lazy = false,
  priority = 999,
  config = function()
    local lualine = require("lualine")
    local nvim_navic = require("nvim-navic")
    local colors = require("tokyonight.colors").setup()
    nvim_navic.setup({
      seperator = "",
      highlight = true,
    })
    local format_name = function(output)
      if excluded_filetypes_table[vim.bo.filetype] then
        return ""
      end
      return output
    end
    local filename_symbol = function(output)
      if excluded_filetypes_table[vim.bo.filetype] then
        return ""
      end
      local icon = require("mini.icons").get("filetype", vim.bo.filetype)
      if not icon then
        return output
      end
      return icon .. " " .. output
    end
    local branch_max_width = 40
    local branch_min_width = 10

    lualine.setup({
      options = {
        theme = require("core.lualine-theme").theme(),
        disabled_filetypes = {
          winbar = excluded_filetypes_array,
        },
        component_separators = { left = "", right = "" },
        section_separators = { left = "\n", right = "" },
        globalstatus = true,
      },
      sections = {
        lualine_a = {
          { "mode", icon = "", padding = { left = 0, right = 3 } },
        },
        lualine_b = {
          {
            "branch",
            icon = "",
            padding = { right = 2, left = 0 },
            fmt = function(output)
              local win_width = vim.o.columns
              local max = branch_max_width
              if win_width * 0.25 < max then
                max = math.floor(win_width * 0.25)
              end
              if max < branch_min_width then
                max = branch_min_width
              end
              if max % 2 ~= 0 then
                max = max + 1
              end
              if output:len() >= max then
                return output:sub(1, (max / 2) - 1) .. "..." .. output:sub(-1 * ((max / 2) - 1), -1)
              end
              return output
            end,
          },
        },
        lualine_c = {
          {
            "filename",
            file_status = false,
            path = 1,
            fmt = filename_symbol,
          },
          {
            function()
              return "◉"
            end,
            cond = function()
              return vim.bo.modified
            end,
            color = { fg = colors.yellow },
          },
          {
            "diagnostics",
            update_in_insert = true,
            symbols = {
              error = " ",
              warn = " ",
              info = " ",
              hint = "󰝶 ",
            },
            padding = { left = 3, right = 0 },
          },
        },
        lualine_x = {
          "import",
          {
            function()
              local lsps = vim.lsp.get_clients({ bufnr = vim.fn.bufnr() })
              local icon = require("nvim-web-devicons").get_icon_by_filetype(vim.bo.filetype)
              if lsps and #lsps > 0 then
                local names = {}
                for _, lsp in ipairs(lsps) do
                  table.insert(names, lsp.name)
                end
                return string.format("%s %s", table.concat(names, ", "), icon)
              else
                return icon or ""
              end
            end,
            on_click = function()
              vim.api.nvim_command("LspInfo")
            end,
          },
        },
        -- Combine x and y
        lualine_y = {
          { "progress", padding = { left = 3, right = 2 } },
        },
        lualine_z = {
          "location",
          {
            function()
              local starts = vim.fn.line("v")
              local ends = vim.fn.line(".")
              local count = starts <= ends and ends - starts + 1 or starts - ends + 1
              return count .. "V"
            end,
            cond = function()
              return vim.fn.mode():find("[Vv]") ~= nil
            end,
          },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            "filetype",
            icon_only = true,
          },
          {
            "filename",
            path = 1,
            fmt = format_name,
          },
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      winbar = {
        lualine_a = {
          {
            "filename",
            file_status = false,
            path = 0,
            fmt = filename_symbol,
            padding = { right = 1 },
            color = { fg = colors.blue, gui = "none" },
          },
        },
        lualine_b = {},
        lualine_c = {
          {
            function()
              if not nvim_navic.is_available() then
                return "ssd"
              end
              local details = {}
              for _, item in ipairs(nvim_navic.get_data()) do
                -- For some reason sumneko adds a random ` ->` to the end of the name *sometimes*
                -- This accounts for that I guess...
                table.insert(details, item.icon .. item.name:gsub("%s*->%s*", ""))
                -- Looks like we have some more weirdness coming from sumneko...
              end
              return table.concat(details, " ● ")
            end,
            color = { fg = "#5b6281" },
          },
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      inactive_winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { "filename", file_status = false, path = 0, fmt = filename_symbol } },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    })
  end,
}
