local group = vim.api.nvim_create_augroup("Statusline", { clear = true })

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
	group = group,
	desc = "Set active statusline on buf enter",
	pattern = "*",
	callback = function()
		if vim.bo.filetype ~= "minifiles" then
			vim.opt_local.statusline = "%!v:lua.Statusline.active()"
			vim.opt_local.tabline = "%!v:lua.Tabline.active()"
		end
	end,
})

vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
	group = group,
	desc = "Set inactive statusline on buf leave",
	pattern = "*",
	callback = function()
		if vim.bo.filetype ~= "minifiles" then
			vim.opt_local.statusline = "%!v:lua.Statusline.inactive()"
			vim.opt_local.tabline = "%!v:lua.Tabline.inactive()"
		end
	end,
})

local timer = nil
vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI", "CursorMoved", "CursorMovedI" }, {
	group = group,
	desc = "Refresh statusline on LSP events",
	pattern = "*",
	callback = function()
		if timer then
			vim.fn.timer_stop(timer)
		end
		timer = vim.fn.timer_start(
			100,
			vim.schedule_wrap(function()
				vim.cmd("redrawtabline")
			end)
		)
	end,
})
