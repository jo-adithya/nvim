MiniDeps.add("nvim-mini/mini.starter")

function setup()
	require("mini.starter").setup()
end

if not vim.g.vscode then
	MiniDeps.now(setup)
end
