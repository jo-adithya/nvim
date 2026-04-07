vim.api.nvim_create_autocmd("BufEnter", {
	once = true,
	callback = function()
		vim.pack.add({"https://github.com/folke/zen-mode.nvim"})

    -- Setup --

    require("zen-mode").setup()
	end,
})
