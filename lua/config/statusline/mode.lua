local utils = require("config.statusline.utils")

local mode_map = {
  ["n"] = "NORMAL",
  ["no"] = "NORMAL",
  ["v"] = "VISUAL",
  ["V"] = "V-LINE",
  ["\22"] = "V-BLOCK",
  ["i"] = "INSERT",
  ["ic"] = "INSERT",
  ["c"] = "COMMAND",
  ["r"] = "REPLACE",
  ["r?"] = "CONFIRM",
  ["!"] = "SHELL",
  ["t"] = "TERMINAL",
  ["nt"] = "TERMINAL",
}

local mode_hl_map = {
  ["NORMAL"] = "StatuslineNormal",
  ["VISUAL"] = "StatuslineVisual",
  ["V-LINE"] = "StatuslineVisual",
  ["V-BLOCK"] = "StatuslineVisual",
  ["INSERT"] = "StatuslineInsert",
  ["COMMAND"] = "StatuslineCommand",
  ["TERMINAL"] = "StatuslineCommand",
}

local M = {}

function M()
  local current_mode = vim.api.nvim_get_mode().mode
  local mode_str = mode_map[current_mode] or current_mode
  local hl_group = mode_hl_map[mode_str] or nil
  return utils.format_component("▌  " .. mode_str, hl_group, "")
end

return M
