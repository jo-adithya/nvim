vim.pack.add({ "https://github.com/chomosuke/typst-preview.nvim" })

-- Setup --

vim.api.nvim_create_autocmd("FileType", {
	once = true,
	pattern = "typst",
	callback = function()
		require("typst-preview").setup({
			invert_colors = "auto",
		})
	end,
})
