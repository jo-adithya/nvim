MiniDeps.add("zbirenbaum/copilot.lua")

local copilot_loaded = false
local copilot_enabled = false

local function setup()
	if copilot_loaded then
		return
	end

	require("copilot").setup({
		panel = {
			enabled = false,
		},
		suggestion = {
			enabled = false,
		},
		filetypes = {
			markdown = true,
			help = true,
		},
		should_attach = function()
			return copilot_enabled
		end,
	})

	copilot_loaded = true
end

local function enable()
	copilot_enabled = true
	setup()
end

local function disable()
	copilot_enabled = false

	pcall(function()
		require("copilot.suggestion").dismiss()
	end)
end

vim.api.nvim_create_user_command("CopilotEnable", enable, { desc = "Enable Copilot" })
vim.api.nvim_create_user_command("CopilotDisable", disable, { desc = "Disable Copilot" })
vim.api.nvim_create_user_command("CopilotToggle", function()
	if copilot_enabled then
		disable()
	else
		enable()
	end
end, { desc = "Toggle Copilot" })
