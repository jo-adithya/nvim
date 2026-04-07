vim.pack.add({ "https://github.com/folke/zen-mode.nvim" })

-- Setup --

vim.api.nvim_create_autocmd("BufEnter", {
	once = true,
	callback = function()
		require("zen-mode").setup()
	end,
})
