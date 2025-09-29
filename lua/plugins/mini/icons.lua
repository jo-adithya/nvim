MiniDeps.add("nvim-mini/mini.icons")

function setup()
	require("mini.icons").setup({
		default = {
			file = { glyph = "" },
			directory = { glyph = "" },
		},
		extension = {
			js = { glyph = "" },
			ipynb = { glyph = "" },
			jpg = { glyph = "" },
			png = { glyph = "" },
			pdf = { glyph = "" },
		},
	})
end

MiniDeps.now(setup)
