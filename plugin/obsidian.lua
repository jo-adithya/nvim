vim.pack.add({ "https://github.com/obsidian-nvim/obsidian.nvim" })

-- Setup --

vim.schedule(function()
	require("obsidian").setup({
		legacy_commands = false,
		templates = {
			folder = "99-meta/templates",
		},
		frontmatter = {
			enabled = false,
		},
		checkbox = {
			order = { " ", "x" },
		},
		daily_notes = {
			enabled = true,
			folder = "01-daily-notes",
			date_format = "YYYY-MM-DD",
			template = "daily-note.md",
			default_tags = {},
		},
		workspaces = {
			{
				name = "ideaverse",
				path = "~/documents/ideaverse",
			},
		},
	})

	-- Keymaps --

	local wk = require("which-key")
	wk.add({
		{ "<leader>o", group = "Obsidian", icon = { icon = "󰍘", color = "blue" } },
		{ "<leader>oo", "<cmd>Obsidian quick_switch<cr>", desc = "Quick switch" },
		{ "<leader>od", group = "Daily Notes" },
		{ "<leader>odd", "<cmd>Obsidian dailies<cr>", desc = "Obsidian dailies" },
		{ "<leader>odt", "<cmd>Obsidian today<cr>", desc = "Obsidian today" },
		{ "<leader>ody", "<cmd>Obsidian yesterday<cr>", desc = "Obsidian yesterday" },
		{ "<leader>on", group = "Note" },
		{ "<leader>ont", "<cmd>Obsidian toc<cr>", desc = "Table of contents" },
		{ "<leader>onl", "<cmd>Obsidian links<cr>", desc = "Pick links" },
		{ "<leader>onb", "<cmd>Obsidian backlinks<cr>", desc = "Pick backlinks" },
	})
end)
