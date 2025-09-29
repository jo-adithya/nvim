MiniDeps.add("zbirenbaum/copilot.lua")

function setup()
	require("copilot").setup({
		suggestion = {
			auto_trigger = true,
			keymap = {
				accept = "<C-l>",
				next = "<C-n>",
				prev = "<C-p>",
        dismiss = "<C-e>",
			},
		},
		panel = {
			enabled = false,
		},
	})
end

MiniDeps.later(setup)
