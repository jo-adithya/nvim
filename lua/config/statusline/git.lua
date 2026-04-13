local utils = require("config.statusline.utils")

local M = {}

function M.branch(hl)
  local branch = vim.b.gitsigns_head
  if not branch then
    return ""
  end
  return utils.format_component(" " .. branch, hl)
end

return M
