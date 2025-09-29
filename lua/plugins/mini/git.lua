MiniDeps.add("nvim-mini/mini-git")

function setup()
	require("mini.git").setup()
end

MiniDeps.later(setup)
