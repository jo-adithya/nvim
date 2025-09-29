MiniDeps.add({ source = "m4xshen/hardtime.nvim", depends = { "MunifTanjim/nui.nvim" } })

function setup()
	require("hardtime").setup({
		disable_mouse = false,
		disabled_keys = {
			["<Up>"] = { "n" },
			["<Down>"] = { "n" },
			["<Left>"] = { "n" },
			["<Right>"] = { "n" },
		},
	})
end

if not vim.g.vscode then
	MiniDeps.later(setup)
end
