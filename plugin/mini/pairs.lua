vim.pack.add({ "https://github.com/nvim-mini/mini.pairs" })

-- Setup --

vim.api.nvim_create_autocmd("BufEnter", {
	once = true,
	callback = function()
		require("mini.pairs").setup()
	end,
})
