-- Config inspired by https://github.com/scottmckendry/Windots/blob/main/nvim/lua/core/statusline.lua

local Components = {}

-- Mode mappings
local mode_map = {
	["n"] = "NORMAL",
	["no"] = "NORMAL",
	["v"] = "VISUAL",
	["V"] = "V-LINE",
	["\22"] = "V-BLOCK",
	["i"] = "INSERT",
	["c"] = "COMMAND",
	["r"] = "REPLACE",
	["r?"] = "CONFIRM",
	["!"] = "SHELL",
	["t"] = "TERMINAL",
	["nt"] = "TERMINAL",
}

local mode_hl_map = {
	["NORMAL"] = "Directory",
	["VISUAL"] = "Number",
	["V-LINE"] = "Number",
	["V-BLOCK"] = "Number",
	["INSERT"] = "String",
	["COMMAND"] = "Keyword",
	["TERMINAL"] = "Keyword",
}

----------------------------------
--       Helper Functions       --
----------------------------------

--- Global function for statusline component rendering. Can be called directly from the statusline
--- @param name string The name of the component to render
--- @param hl string The highlight group to use for the component
--- @return string
function _G._statusline_component(name, hl)
	local component_ = Components[name]
	if component_ == nil then
		return ""
	end
	return component_(hl)
end

--- Generate a statusline component with optional highlight group
--- @param val string The value to render
--- @param hl string|nil The highlight group to use
--- @return string
local function component(val, hl)
	if val == nil or val == "" then
		return ""
	end

	if hl == nil then
		return "%{%v:lua._statusline_component('" .. val .. "')%}"
	end
	return "%{%v:lua._statusline_component('" .. val .. "', '" .. hl .. "')%}"
end

--- Format a given component value with a highlight group in the format expected by the statusline
--- @param val string The value to format
--- @param hl string|nil The highlight group to use
--- @param l_sep string|nil The left separator to use
--- @param r_sep string|nil The right separator to use
--- @return string
local function format_component(val, hl, l_sep, r_sep)
	l_sep = l_sep or "  "
	r_sep = r_sep or " "
	hl = hl or "Comment"
	return l_sep .. "%#" .. hl .. "#" .. val .. "%*" .. r_sep
end

--- Get the count of diagnostics for a given severity
--- @param severity "ERROR"|"WARN"|"HINT"|"INFO"
--- @return number
local function get_diagnostic_count(severity)
	return #vim.diagnostic.get(0, { severity = vim.diagnostic.severity[severity] })
end

----------------------------------
--          Components          --
----------------------------------

--- Mode component with dynamic highlights
--- @return string
Components.mode = function()
	local current_mode = vim.api.nvim_get_mode().mode
	local mode_str = mode_map[current_mode] or "UNKNOWN"
	local hl_group = mode_hl_map[mode_str] or nil
	return format_component(" " .. mode_str, hl_group, " ")
end

--- Git branch component based on CWD - depends on gitsigns.nvim
--- @param hl string The highlight group to use
--- @return string
Components.git_branch = function(hl)
	local branch = vim.b.gitsigns_head
	if not branch then
		return ""
	end
	return format_component(" " .. branch, hl)
end

--- Buffer diagnostics component
--- @return string
Components.diagnostics = function()
	local errors = get_diagnostic_count("ERROR")
	local warnings = get_diagnostic_count("WARN")
	local hints = get_diagnostic_count("HINT")
	local info = get_diagnostic_count("INFO")

  if errors + warnings + hints + info == 0 then
		return ""
	end

	local components = {
		errors > 0 and format_component(" " .. errors, "DiagnosticError", "") or "",
		warnings > 0 and format_component(" " .. warnings, "DiagnosticWarn", "") or "",
		hints > 0 and format_component(" " .. hints, "DiagnosticHint", "") or "",
		info > 0 and format_component("󰝶 " .. info, "DiagnosticInfo", "") or "",
	}

	return " " .. table.concat(components, "") .. " "
end

--- File name component - show the current buffer's file name and coloured icon. Depends on mini.icons.
--- @param hl string The highlight group to use
Components.file_name = function(hl)
	local ft_overrides = {
		["copilot-chat"] = { name = "copilot", icon = "󰚩 ", icon_hl = "MiniIconsAzure" },
		["grug-far"] = { name = "grug-far", icon = " ", icon_hl = "DiagnosticWarn" },
		["ministarter"] = { name = "", icon = "", icon_hl = "Directory" },
		["mason"] = { name = "mason", icon = "󱌣 ", icon_hl = "MiniIconsAzure" },
		["minifiles"] = { name = "files", icon = "󰝰 ", icon_hl = "Directory" },
		["snacks_picker_input"] = { name = "picker", icon = "󰦨 ", icon_hl = "Changed" },
	}

	local fn_overrides = {
		["k9s"] = { icon = "󱃾 ", icon_hl = "Directory" },
		["lazygit"] = { icon = " ", icon_hl = "Changed" },
	}

	local ft = vim.bo.filetype
	if ft_overrides[ft] then
		return format_component(ft_overrides[ft].icon, ft_overrides[ft].icon_hl, " ", "")
			.. format_component(ft_overrides[ft].name, hl, " ")
	end

	local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":t")
	if filename == "" then
		return ""
	end

	local icon, icon_hl = require("mini.icons").get("file", filename)

	-- Override or set custom icons
	if fn_overrides[filename] then
		icon = fn_overrides[filename].icon
		icon_hl = fn_overrides[filename].icon_hl
	end

	return format_component(icon, icon_hl, "  ", "") .. format_component(filename, hl, " ")
end

--- Progress component - show percentage of buffer scrolled
--- @param hl string|nil The highlight group to use
Components.progress = function(hl)
	return format_component("%2p%%", hl)
end

--- Location component - show current line and column
--- @param hl string|nil The highlight group to use
Components.location = function(hl)
	return format_component("%l:%c", hl, "  ", " ")
end

local components = {
	component("mode"),
	component("git_branch", "Changed"),
	component("file_name", "Normal"),
	component("diagnostics"),
	"%=", -- mark end of left alignment
	component("progress", "Special"),
	component("location", "Changed"),
}

return {
	statusline = table.concat(components, ""),
}
