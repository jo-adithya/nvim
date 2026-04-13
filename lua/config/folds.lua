local M = {}

local function trim(text)
  return (text:gsub("^%s+", ""):gsub("%s+$", ""))
end

local function shorten(text, width)
  if width <= 0 then
    return ""
  end

  if vim.fn.strdisplaywidth(text) <= width then
    return text
  end

  return vim.fn.strcharpart(text, 0, math.max(0, width - 1)) .. "…"
end

function M.foldtext()
  local start_line = vim.v.foldstart
  local end_line = vim.v.foldend
  local total_lines = end_line - start_line + 1
  local indent = vim.fn.indent(start_line)

  local line = ""
  for lnum = start_line, end_line do
    line = trim(vim.fn.getline(lnum))
    if line ~= "" then
      break
    end
  end

  if line == "" then
    line = "[fold]"
  end

  local indent_prefix = string.rep(" ", indent)
  local width = vim.api.nvim_win_get_width(0) - vim.fn.strdisplaywidth(indent_prefix) - 18
  local label = shorten(line, width)

  return indent_prefix .. string.format("󰁂 %s  ·  %d lines", label, total_lines)
end

return M
