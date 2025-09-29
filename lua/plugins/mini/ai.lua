MiniDeps.add("nvim-mini/mini.ai")

function setup()
	require("mini.ai").setup()
end

MiniDeps.later(setup)
