vim.api.nvim_create_autocmd("BufEnter", {
	once = true,
	callback = function()
		vim.pack.add({"https://github.com/folke/flash.nvim"})
	
    -- Setup --

	require("flash").setup({
		modes = {
			char = {
				jump_labels = true,
			},
		},
	})

	-- Keymaps
	local keymap = vim.keymap.set
	keymap({ "n", "x", "o" }, "s", function()
		require("flash").jump()
	end, { desc = "Flash" })
	keymap({ "n", "x", "o" }, "S", function()
		require("flash").treesitter()
	end, { desc = "Flash treesitter" })
	keymap({ "c" }, "<C-s>", function()
		require("flash").toggle()
	end, { desc = "Toggle flash search" })
	end,
})
