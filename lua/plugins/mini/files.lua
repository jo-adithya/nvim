MiniDeps.add("nvim-mini/mini.files")

function setup()
	require("mini.files").setup({
		content = {
			prefix = function(fs_entry)
        local icon, hl = MiniFiles.default_prefix(fs_entry)
				return " " .. icon .. " ", hl
			end,
		},
		windows = {
			preview = true,
		},
	})

	vim.keymap.set("n", "<leader>e", function()
		if not MiniFiles.close() then
			MiniFiles.open(vim.api.nvim_buf_get_name(0))
		end
	end, { desc = "Open file explorer in current file" })

	vim.keymap.set("n", "<leader>E", function()
		if not MiniFiles.close() then
			MiniFiles.open()
		end
	end, { desc = "Open file explorer in current working directory" })

	-- Autocommands
	vim.api.nvim_create_autocmd("User", {
		pattern = "MiniFilesWindowOpen",
		callback = function(args)
			local win_id = args.data.win_id

			-- Customize window-local settings
			local config = vim.api.nvim_win_get_config(win_id)
			config.border, config.title_pos = "rounded", "center"
			vim.api.nvim_win_set_config(win_id, config)
		end,
	})
end

MiniDeps.later(setup)
