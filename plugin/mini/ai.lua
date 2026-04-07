vim.api.nvim_create_autocmd("BufEnter", {
	once = true,
	callback = function()
		vim.pack.add({"https://github.com/nvim-mini/mini.ai"})

    -- Setup --

    require("mini.ai").setup()
	end,
})
