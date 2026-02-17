local add, now = MiniDeps.add, MiniDeps.now

-- add({ source = "catppuccin/nvim", name = "catppuccin" })
add("olimorris/onedarkpro.nvim")
-- add("folke/tokyonight.nvim")

MiniDeps.later(function()
	vim.cmd("colorscheme onedark")
end)

now(function()
	require("onedarkpro").setup({
		colors = {
			blue = "#82B0FA",
			cyan = "#9DE0D6",
			purple = "#C096FF",
		},
		styles = {
			comments = "italic",
			keywords = "bold,italic",
			functions = "bold,italic",
			conditionals = "bold,italic",
			operators = "bold",
			methods = "bold,italic",
		},
		options = {
			transparency = true,
		},
		highlights = {
			StatuslineNormal = { fg = "${blue}", italic = true, bold = true },
			StatuslineInsert = { fg = "${green}", italic = true, bold = true },
			StatuslineVisual = { fg = "${orange}", italic = true, bold = true },
			StatuslineCommand = { fg = "${purple}", italic = true, bold = true },
			StatuslineGit = { fg = "${purple}", italic = true, bold = true },
			StatuslineFileName = { fg = "${fg}", italic = true },
			["@lsp.typemod.function.defaultLibrary"] = { fg = { dark = "#A6A8F5" } },
			["@lsp.typemod.function.defaultLibrary.lua"] = { link = "@lsp.typemod.function.defaultLibrary" },
			WhichKeyIcon = { fg = "${cyan}", underline = false },
		},
	})

	vim.cmd.colorscheme("onedark")
end)

-- now(function()
-- 	require("catppuccin").setup({
-- 		flavour = "mocha",
-- 		transparent_background = true,
-- 		float = {
-- 			transparent = true,
-- 			solid = false,
-- 		},
-- 		no_italic = false,
-- 		styles = {
-- 			comments = { "italic" },
-- 			keywords = { "italic", "bold" },
-- 			functions = { "italic", "bold" },
-- 			conditionals = { "italic", "bold" },
-- 			loops = { "italic", "bold" },
-- 			operators = { "italic", "bold" },
-- 		},
-- 		term_colors = true,
-- 		dim_inactive = {
-- 			enabled = false, -- dims the background color of inactive window
-- 			shade = "dark",
-- 			percentage = 0.15, -- percentage of the shade to apply to the inactive window
-- 		},
-- 		default_integrations = true,
-- 		auto_integrations = true,
-- 		integrations = {
-- 			cmp = true,
-- 			flash = true,
-- 			gitsigns = true,
-- 			illuminate = true,
-- 			indent_blankline = { enabled = true },
-- 			mason = true,
-- 			markdown = true,
-- 			mini = {
-- 				enabled = true,
-- 				indentscope_color = "blue", -- catppuccin color (eg. `lavender`) Default: text
-- 			},
-- 			native_lsp = {
-- 				enabled = true,
-- 				virtual_text = {
-- 					errors = { "italic" },
-- 					hints = { "italic" },
-- 					warnings = { "italic" },
-- 					information = { "italic" },
-- 					ok = { "italic" },
-- 				},
-- 				underlines = {
-- 					errors = { "undercurl" },
-- 					hints = { "undercurl" },
-- 					warnings = { "undercurl" },
-- 					information = { "undercurl" },
-- 					ok = { "undercurl" },
-- 				},
-- 				inlay_hints = {
-- 					background = true,
-- 				},
-- 			},
-- 			notify = true,
-- 			semantic_tokens = true,
-- 			treesitter = true,
-- 			treesitter_context = true,
-- 		},
-- 	})
--
-- 	-- setup must be called before loading
-- 	vim.cmd.colorscheme("catppuccin")
-- end)
--
