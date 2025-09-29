local add, now = MiniDeps.add, MiniDeps.now

add({
	source = "nvim-mini/mini.clue",
})

now(function()
	local miniclue = require("mini.clue")
	miniclue.setup({
		triggers = {
			{ mode = "n", keys = "<leader>" },
			{ mode = "x", keys = "<leader>" },
			{ mode = "n", keys = "g" },
			{ mode = "x", keys = "g" },
			{ mode = "n", keys = "'" },
			{ mode = "x", keys = "'" },
			{ mode = "n", keys = '"' },
			{ mode = "x", keys = '"' },
			{ mode = "n", keys = "z" },
			{ mode = "x", keys = "z" },
		},
		clues = {
			miniclue.gen_clues.builtin_completion(),
			miniclue.gen_clues.g(),
			miniclue.gen_clues.marks(),
			miniclue.gen_clues.registers(),
			miniclue.gen_clues.windows(),
			miniclue.gen_clues.z(),
			{ mode = "n", keys = "<Leader>f", desc = "+Find" },
			{ mode = "n", keys = "<Leader>c", desc = "+Code Actions" },
      { mode = "n", keys = "gs", desc = "+Surround" }
		},
		-- Clue window settings
		window = {
			-- Floating window config
			config = {
				width = 65,
				border = "rounded",
			},

			-- Delay before showing clue window
			delay = 100,

			-- Keys to scroll inside the clue window
			scroll_down = "<C-d>",
			scroll_up = "<C-u>",
		},
	})
end)
