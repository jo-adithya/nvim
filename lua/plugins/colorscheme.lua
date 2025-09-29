local add, now = MiniDeps.add, MiniDeps.now

add({ source = "catppuccin/nvim", name = "catppuccin" })

now(function()
	require("catppuccin").setup({
		flavour = "mocha",
		transparent_background = true,
		float = {
			transparent = true,
			solid = false,
		},
		no_italic = false,
		styles = {
			comments = { "italic" },
			keywords = { "italic", "bold" },
			functions = { "italic", "bold" },
			conditionals = { "italic", "bold" },
			loops = { "italic", "bold" },
			operators = { "italic", "bold" },
		},
		term_colors = true,
		dim_inactive = {
			enabled = false, -- dims the background color of inactive window
			shade = "dark",
			percentage = 0.15, -- percentage of the shade to apply to the inactive window
		},
		default_integrations = true,
		auto_integrations = true,
		integrations = {
			cmp = true,
			flash = true,
			gitsigns = true,
			illuminate = true,
			indent_blankline = { enabled = true },
			mason = true,
			markdown = true,
			mini = {
				enabled = true,
				indentscope_color = "blue", -- catppuccin color (eg. `lavender`) Default: text
			},
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = { "italic" },
					hints = { "italic" },
					warnings = { "italic" },
					information = { "italic" },
					ok = { "italic" },
				},
				underlines = {
					errors = { "undercurl" },
					hints = { "undercurl" },
					warnings = { "undercurl" },
					information = { "undercurl" },
					ok = { "undercurl" },
				},
				inlay_hints = {
					background = true,
				},
			},
			notify = true,
			semantic_tokens = true,
			treesitter = true,
			treesitter_context = true,
		},
	})

	-- setup must be called before loading
	vim.cmd.colorscheme("catppuccin")

  vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = "Red" })
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn",  { undercurl = true, sp = "Yellow" })
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo",  { undercurl = true, sp = "Blue" })
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint",  { undercurl = true, sp = "Green" })
end)
