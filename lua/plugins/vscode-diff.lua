MiniDeps.add({
	source = "esmuellert/vscode-diff.nvim",
	depends = { "MunifTanjim/nui.nvim" },
})

function setup()
	require("vscode-diff").setup({})
end

MiniDeps.later(setup)
