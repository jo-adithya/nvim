vim.api.nvim_create_autocmd("FileType", {
	once = true,
	pattern = "typst",
	callback = function()
		vim.pack.add({"https://github.com/chomosuke/typst-preview.nvim"})

    -- Setup --

    require("typst-preview").setup({
      invert_colors = "auto",
    })
	end,
})
