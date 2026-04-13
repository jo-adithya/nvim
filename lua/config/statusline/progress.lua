local utils = require("config.statusline.utils")

local M = {}

--- Progress component - show percentage of buffer scrolled.
--- @param hl string|nil The highlight group to use
function M(hl)
	return utils.format_component("%2p%%", hl)
end

return M
