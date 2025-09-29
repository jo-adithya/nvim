local add, now = MiniDeps.add, MiniDeps.now

add("nvim-mini/mini.basics")

now(function()
	require("mini.basics").setup()
end)
