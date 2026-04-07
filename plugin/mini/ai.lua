vim.pack.add({ "https://github.com/nvim-mini/mini.ai" })

-- Setup --

vim.api.nvim_create_autocmd("BufEnter", {
	once = true,
	callback = function()
		require("mini.ai").setup()
	end,
})
