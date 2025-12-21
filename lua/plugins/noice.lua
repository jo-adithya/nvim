MiniDeps.add({
	source = "folke/noice.nvim",
	depends = {
		"MunifTanjim/nui.nvim",
	},
})

function setup()
	require("noice").setup({
		cmdline = {
			format = {
				cmdline = { pattern = "^:", icon = "  ", lang = "vim" },
				filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
				lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "  ", lang = "lua" },
				help = { pattern = "^:%s*he?l?p?%s+", icon = "  " },
				input = { view = "cmdline_input", icon = " 󰥻 " }, -- Used by input()
			},
		},
		notify = {
			enabled = false,
		},
		messages = {
			view = "mini",
			view_error = "mini", -- view for errors
			view_warn = "mini", -- view for warnings
		},
		lsp = {
			-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
			},
		},
		-- you can enable a preset for easier configuration
		presets = {
			bottom_search = true, -- use a classic bottom cmdline for search
			command_palette = true, -- position the cmdline and popupmenu together
			long_message_to_split = true, -- long messages will be sent to a split
			inc_rename = false, -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = false, -- add a border to hover docs and signature help
		},
	})
end

MiniDeps.later(setup)
