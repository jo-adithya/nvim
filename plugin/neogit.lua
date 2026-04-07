vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/NeogitOrg/neogit",
})

-- Setup --

vim.api.nvim_create_autocmd("BufEnter", {
	once = true,
	callback = function()
		local neogit = require("neogit")
		neogit.setup({
			graph_style = "kitty",
			integrations = {
				codediff = true,
				fzf_lua = true,
			},
			diff_viewer = "codediff",
			file_watcher = {
				enabled = false,
			},
			auto_refresh = false,
			kind = "tab",
			floating = {
				width = 0.9,
				height = 0.85,
			},
			signs = {
				-- { CLOSED, OPENED }
				section = { "", "" },
				item = { "", "" },
				hunk = { "", "" },
			},
			mappings = {
				status = {
					["<C-s>"] = "StageUnstaged",
					["S"] = "StageAll",
					[" "] = "Stage",
					["s"] = "Stage",
				},
			},
		})

		local wk = require("which-key")
		wk.add({
			{
				"<C-g>",
				function()
					neogit.open({ cwd = vim.fn.expand("%:p:h") })
				end,
				desc = "Neogit",
			},
			{ "<leader>g", group = "Git", icon = { icon = "", color = "orange" } },
			{
				"<leader>gg",
				function()
					neogit.open({ cwd = vim.fn.expand("%:p:h") })
				end,
				desc = "Neogit",
			},
			{ "<leader>gc", "<cmd>Neogit commit<cr>", desc = "Git commit" },
			{
				"<leader>gb",
				function()
					neogit.open({ "branch" })
				end,
				desc = "Git branch",
			},
			{
				"<leader>gp",
				function()
					neogit.open({ "pull" })
				end,
				desc = "Git pull",
			},
			{
				"<leader>gf",
				function()
					neogit.open({ "fetch" })
				end,
				desc = "Git fetch",
			},
			{
				"<leader>gP",
				function()
					neogit.open({ "push" })
				end,
				desc = "Git push",
			},
		})
	end,
})

function setup() end
