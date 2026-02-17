MiniDeps.add("hedyhli/outline.nvim")

MiniDeps.later(function()
	require("outline").setup({
		symbol_folding = {},
		outline_window = {
			show_cursorline = true,
			hide_cursor = true,
      show_numbers = false,
		},
		preview_window = {
			auto_preview = true,
			border = "rounded",
			height = 80,
		},
		keymaps = {
			toggle_preview = "p",
			hover_symbol = "K",
			fold = "zc",
			unfold = "zo",
      goto_location = "<S-CR>",
      goto_and_close = "<CR>",
		},
		symbols = {
			icons = {
				Function = { icon = "ƒ" },
				File = { icon = "󰈔" },
				Module = { icon = "" },
				Namespace = { icon = "" },
				Package = { icon = "󰏗" },
				Class = { icon = "𝓒" },
				Method = { icon = "ƒ" },
				Property = { icon = "" },
				Field = { icon = "󰆨" },
				Constructor = { icon = "" },
				Enum = { icon = "ℰ" },
				Interface = { icon = "" },
				EnumMember = { icon = "" },
				Event = { icon = "" },
				Operator = { icon = "" },
				TypeParameter = { icon = "" },
				Variable = { icon = "" },
				Constant = { icon = "" },
				String = { icon = "" },
				Number = { icon = "" },
				Boolean = { icon = "" },
				Array = { icon = "󰅪" },
				Object = { icon = "" },
				Key = { icon = "" },
				Null = { icon = "" },
				Struct = { icon = "𝓢" },
				Text = { icon = "" },
				Parameter = { icon = "" },
				StaticMethod = { icon = "ƒ" },
				Macro = { icon = "" },
				Keyword = { icon = "" },
				Unit = { icon = "" },
				Value = { icon = "" },
				Component = { icon = "󰅴" },
				Fragment = { icon = "󰅴" },
				Misc = { icon = "" },
				TypeAlias = { icon = "" },
			},
		},
	})

	local wk = require("which-key")
	wk.add({
		{ "<leader>cs", "<cmd>Outline<CR>", desc = "Toggle outline" },
	})
end)
