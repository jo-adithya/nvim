MiniDeps.add("folke/flash.nvim")

function setup()
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
end

MiniDeps.later(setup)
