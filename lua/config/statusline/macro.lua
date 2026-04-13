local utils = require("config.statusline.utils")

local M = {}

function M.recording()
  local reg = vim.fn.reg_recording()
  if reg == "" then
    return ""
  end
  return utils.format_component("󰐾 " .. reg, "DiagnosticError")
end

return M
