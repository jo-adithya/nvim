local M = {}

--- Format a given component value with a highlight group in the format expected by the statusline.
--- @param val string The value to format
--- @param hl string|nil The highlight group to use
--- @param l_sep string|nil The left separator to use
--- @param r_sep string|nil The right separator to use
--- @return string
function M.format_component(val, hl, l_sep, r_sep)
	l_sep = l_sep or "  "
	r_sep = r_sep or " "
	hl = hl or "Comment"
	return l_sep .. "%#" .. hl .. "#" .. val .. "%*" .. r_sep
end

return M
