local utils = require("config.statusline.utils")

local M = {}

--- Location component - show current line and column.
--- @param hl string|nil The highlight group to use
function M(hl)
	return utils.format_component("%l:%c", hl, "  ", " ")
end

return M
