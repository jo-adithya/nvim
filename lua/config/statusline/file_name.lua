local utils = require("config.statusline.utils")

local M = {}

function M(hl, lsep)
  local ft_overrides = {
    ["copilot-chat"] = { name = "copilot", icon = "󰚩 ", icon_hl = "MiniIconsAzure" },
    ["grug-far"] = { name = "grug-far", icon = " ", icon_hl = "DiagnosticWarn" },
    ["ministarter"] = { name = "", icon = "", icon_hl = "Directory" },
    ["mason"] = { name = "mason", icon = "󱌣 ", icon_hl = "MiniIconsAzure" },
    ["minifiles"] = { name = "files", icon = "󰝰 ", icon_hl = "Directory" },
    ["yazi"] = { name = "files", icon = "󰝰 ", icon_hl = "Directory" },
    ["snacks_picker_input"] = { name = "picker", icon = "󰦨 ", icon_hl = "Changed" },
  }

  local fn_overrides = {
    ["k9s"] = { icon = "󱃾 ", icon_hl = "Directory" },
    ["lazygit"] = { icon = " ", icon_hl = "Changed" },
  }

  local winid = vim.g.statusline_winid or vim.g.winbar_winid
  local bufnr = vim.api.nvim_win_get_buf(winid)

  local ft = vim.bo[bufnr].filetype
  if ft_overrides[ft] then
    return utils.format_component(ft_overrides[ft].icon, ft_overrides[ft].icon_hl, lsep or " ", "")
      .. utils.format_component(ft_overrides[ft].name, hl, " ")
  end

  local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":t")
  if filename == "" then
    return ""
  end

  local fn_override = fn_overrides[filename]
  local icon, icon_hl
  if fn_override then
    icon = fn_override.icon
    icon_hl = fn_override.icon_hl
  else
    icon, icon_hl = require("mini.icons").get("file", filename)
  end

  local modified = vim.bo[bufnr].modified and " " or ""
  local readonly = vim.bo[bufnr].readonly and " 󰌾" or ""
  return utils.format_component(icon, icon_hl, lsep or "  ", "")
    .. utils.format_component(filename .. modified .. readonly, hl, " ")
end

return M
