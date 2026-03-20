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
	require("mini.icons").mock_nvim_web_devicons()
end

MiniDeps.now(setup)
