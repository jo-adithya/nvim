local utils = require("config.statusline.utils")

local M = {}

local function get_diagnostic_count(severity)
  return #vim.diagnostic.get(0, { severity = vim.diagnostic.severity[severity] })
end

function M()
  local errors = get_diagnostic_count("ERROR")
  local warnings = get_diagnostic_count("WARN")
  local hints = get_diagnostic_count("HINT")
  local info = get_diagnostic_count("INFO")

  if errors + warnings + hints + info == 0 then
    return ""
  end

  local components = {
    errors > 0 and utils.format_component(" " .. errors, "DiagnosticError", "") or "",
    warnings > 0 and utils.format_component(" " .. warnings, "DiagnosticWarn", "") or "",
    hints > 0 and utils.format_component(" " .. hints, "DiagnosticHint", "") or "",
    info > 0 and utils.format_component("󰝶 " .. info, "DiagnosticInfo", "") or "",
  }

  return " " .. table.concat(components, "") .. " "
end

return M
