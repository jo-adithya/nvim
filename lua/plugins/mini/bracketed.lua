MiniDeps.add("nvim-mini/mini.bracketed")

function setup()
	require("mini.bracketed").setup()
end

MiniDeps.later(setup)
