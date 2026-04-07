vim.api.nvim_create_autocmd("BufEnter", {
	once = true,
	callback = function()
		vim.pack.add({"https://github.com/rachartier/tiny-inline-diagnostic.nvim"})

    -- Setup -- 

	require("tiny-inline-diagnostic").setup({
		options = {
			multilines = {
				enabled = true,
			},
		},
	})
	end,
})
