local mode = require("config.statusline.mode")
local git = require("config.statusline.git")
local diagnostics = require("config.statusline.diagnostics")
local macro = require("config.statusline.macro")
local progress = require("config.statusline.progress")
local location = require("config.statusline.location")
local file_name = require("config.statusline.file_name")
local breadcrumbs = require("config.statusline.breadcrumbs")

Statusline = {
	active = function()
		return table.concat({
			mode(),
			git.branch("StatuslineGit"),
			diagnostics(),
			"%=",
			macro.recording(),
			progress("Special"),
			location("Changed"),
		})
	end,
	inactive = function()
		return table.concat({
			"%=",
			progress("Comment"),
			location("Comment"),
		})
	end,
}

Winbar = {
	active = function()
		return table.concat({
			file_name("StatuslineFileName", ""),
			breadcrumbs("Comment"),
		})
	end,
	inactive = function()
		return table.concat({
			file_name("Comment", ""),
		})
	end,
}

Winbar.build = function()
	local is_active = vim.g.statusline_winid == vim.api.nvim_get_current_win()
	if is_active then
		return Winbar.active()
	end
	return Winbar.inactive()
end

vim.go.winbar = "%!v:lua.Winbar.build()"
vim.go.statusline = "%!v:lua.Statusline.active()"

vim.api.nvim_create_autocmd({ "LspAttach", "LspDetach", "DiagnosticChanged" }, {
	group = vim.api.nvim_create_augroup("StatuslineUpdate", { clear = true }),
	pattern = "*",
	callback = vim.schedule_wrap(function()
		vim.cmd("redrawstatus")
	end),
	desc = "Update statusline/winbar on LSP and diagnostics update",
})
