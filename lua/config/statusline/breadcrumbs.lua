local utils = require("config.statusline.utils")

local M = {}

function M(hl)
	local status, aerial = pcall(require, "aerial")
	if not status then
		return ""
	end

	local symbols = aerial.get_location()
	if not symbols then
		return ""
	end

	local result = {}
	for i, loc in ipairs(symbols) do
		result[i] = loc.icon .. " " .. loc.name
	end
	return utils.format_component(table.concat(result, "   "), hl, "   ")
end

return M
