MiniDeps.add("sindrets/diffview.nvim")

function setup()
	---@diagnostic disable-next-line: missing-fields
	---@type DiffviewConfig
	local config = {
		enhanced_diff_hl = true,
		show_icons = true,
		view = {
      merge_tool = {
        disable_diagnostics = true,
      }
		},
	}
	require("diffview").setup(config)

	-- vim.keymap.set("n", "<leader>dv", function()
	--   require("diffview").open()
	-- end, { desc = "Open Diffview" })
	--
	-- vim.keymap.set("n", "<leader>dc", function()
	--   require("diffview").close()
	-- end, { desc = "Close Diffview" })
end

MiniDeps.later(setup)
