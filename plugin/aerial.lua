vim.pack.add({ "https://github.com/stevearc/aerial.nvim" })

-- Setup --

vim.api.nvim_create_autocmd("BufEnter", {
	once = true,
	callback = function()
		require("aerial").setup({
			layout = {
				min_width = { 0.2, 30 },
				max_width = { 0.45, 50 },
			},
			nerd_font = true,
			show_guides = true,
			guides = {
				-- When the child item has a sibling below it
				mid_item = "├─ ",
				-- When the child item is the last in the list
				last_item = "└─ ",
				-- When there are nested child guides to the right
				nested_top = "│  ",
				-- Raw indentation
				whitespace = "   ",
			},
			icons = {
				Collapsed = "",
			},

			-- optionally use on_attach to set keymaps when aerial has attached to a buffer
			on_attach = function(bufnr)
				-- Jump forwards/backwards with '{' and '}'
				vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
				vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
			end,
		})

		vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle<CR>")
	end,
})
