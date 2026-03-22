local copilot_enabled = false

local function set_blink_state(enabled)
	vim.g.copilot_enabled = enabled and 1 or 0
end

local function copilot_clients()
	return vim.lsp.get_clients({ name = "copilot" })
end

local function enable()
	copilot_enabled = true
	set_blink_state(true)

	pcall(vim.lsp.enable, "copilot")
end

local function disable()
	copilot_enabled = false
	set_blink_state(false)

	for _, client in ipairs(copilot_clients()) do
		if not client:is_stopped() then
			client:stop(true)
		end
	end
end

vim.g.copilot_enabled = 0

vim.api.nvim_create_user_command("CopilotEnable", enable, { desc = "Enable Copilot LSP" })
vim.api.nvim_create_user_command("CopilotDisable", disable, { desc = "Disable Copilot LSP" })
vim.api.nvim_create_user_command("CopilotToggle", function()
	if copilot_enabled then
		disable()
	else
		enable()
	end
end, { desc = "Toggle Copilot LSP" })
