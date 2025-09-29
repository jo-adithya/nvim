-- auto-load all plugin modules in lua/plugins/
local plugin_dir = vim.fn.stdpath("config") .. "/lua/plugins"
for _, file in ipairs(vim.fn.readdir(plugin_dir)) do
	if file:match("%.lua$") and file ~= "init.lua" then
		require("plugins." .. file:gsub("%.lua$", ""))
	end
end

-- auto-load all plugin modules in lua/plugins/mini
local plugin_dir = vim.fn.stdpath("config") .. "/lua/plugins/mini"
for _, file in ipairs(vim.fn.readdir(plugin_dir)) do
	if file:match("%.lua$") and file ~= "init.lua" then
		require("plugins.mini." .. file:gsub("%.lua$", ""))
	end
end
