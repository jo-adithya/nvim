MiniDeps.add("nvim-mini/mini.completion")

local function setup()
	-- Mini Completion Setup
	require("mini.completion").setup({
		window = {
			info = { height = 25, width = 80, border = "rounded" },
			signature = { height = 25, width = 80, border = "rounded" },
		},
	})

	-- Mini Completion Keymaps
	vim.keymap.set("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true })
	vim.keymap.set("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })

	-- Don't add a newline when accepting a completion
	_G.cr_action = function()
		-- If there is selected item in popup, accept it with <C-y>
		if vim.fn.complete_info()["selected"] ~= -1 then
			return "\25"
		end
		-- Fall back to plain `<CR>`. You might want to customize according
		-- to other plugins. For example if 'mini.pairs' is set up, replace
		-- next line with `return MiniPairs.cr()`
		return MiniPairs.cr()
	end

	vim.keymap.set("i", "<CR>", "v:lua.cr_action()", { expr = true })
end

MiniDeps.now(setup)
