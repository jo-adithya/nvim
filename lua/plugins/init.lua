
function load_plugins(plugin_path)
	local plugin_dir = vim.fn.stdpath("config") .. "/lua/plugins/" .. plugin_path
	for _, file in ipairs(vim.fn.readdir(plugin_dir)) do
		if file:match("%.lua$") and file ~= "init.lua" then
			local module_name = file:gsub("%.lua$", "")
			require("plugins." .. plugin_path .. "." .. module_name)
		end
	end
end

load_plugins("")
load_plugins("mini")
load_plugins("folke")
