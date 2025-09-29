MiniDeps.add("nvim-mini/mini.pick")

local function get_recent_files()
	local valid_files = {}
	for _, file in ipairs(vim.v.oldfiles) do
		if vim.fn.filereadable(file) == 1 then
			table.insert(valid_files, { path = file, text = vim.fn.fnamemodify(file, ":t") })
		end
		if #valid_files >= 10 then
			break
		end
	end
	return valid_files
end

local function setup()
	local win_config = function()
		local height = math.floor(0.618 * vim.o.lines)
		local width = math.floor(0.618 * vim.o.columns)
		return {
			border = "rounded",
			anchor = "NW",
			height = height,
			width = width,
			row = math.floor(0.5 * (vim.o.lines - height)),
			col = math.floor(0.5 * (vim.o.columns - width)),
		}
	end

	require("mini.pick").setup({
		mappings = {
			toggle_info = "<C-k>",
			toggle_preview = "<C-p>",
			move_down = "<Tab>",
			move_up = "<S-Tab>",
		},
		window = { config = win_config, prompt_prefix = "    " },
	})

	-- vim.keymap.set("n", "<leader>f", { desc = "+Find" })
	vim.keymap.set("n", "<leader>ff", "<cmd>Pick files<CR>", { desc = "Find files" })
	vim.keymap.set("n", "<leader><space>", "<cmd>Pick files<CR>", { desc = "Find files" })
	vim.keymap.set("n", "<leader>fc", function()
		MiniPick.builtin.files(nil, { source = { cwd = vim.fn.stdpath("config"), name = "Config Files" } })
	end, { desc = "Find config files" })
	vim.keymap.set("n", "<leader>fr", function()
		MiniPick.start({
			source = {
				items = get_recent_files,
				name = "Recent Files",
				show = function(buf_id, items, query)
					MiniPick.default_show(buf_id, items, query, { show_icons = true })
				end,
			},
		})
	end, { desc = "Find recent files" })
	vim.keymap.set("n", "<leader>fb", "<cmd>Pick buffers<CR>", { desc = "Find buffers" })
	vim.keymap.set("n", "<leader>,", "<cmd>Pick buffers<CR>", { desc = "Find buffers" })
	vim.keymap.set("n", "<leader>/", "<cmd>Pick grep_live<CR>", { desc = "Grep live" })
	vim.keymap.set("n", "<leader>fh", "<cmd>Pick help default_split='vertical'<CR>", { desc = "Find help" })
end

MiniDeps.later(setup)
