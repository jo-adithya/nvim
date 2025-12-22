MiniDeps.add("stevearc/aerial.nvim")

function setup()
	require("aerial").setup({
		layout = {
			default_direction = "float",
			max_width = { 100, 0.5 },
			min_width = { 40, 0.25 },
		},
		autojump = true,
		close_on_select = true,
		float = {
			relative = "win",
		},
		nav = {
			min_width = { 40 },
			autojump = true,
			preview = true,
		},
		-- A list of all symbols to display. Set to false to display all symbols.
		-- This can be a filetype map (see :help aerial-filetype-map)
		-- To see all available values, see :help SymbolKind
		filter_kind = false,
		-- filter_kind = {
		-- 	"Class",
		-- 	"Constant",
		-- 	"Constructor",
		-- 	"Enum",
		-- 	"Function",
		-- 	"Interface",
		-- 	"Module",
		-- 	"Method",
		--     "Object",
		-- 	"Struct",
		--     "Variable",
		-- },
	})
	-- You probably also want to set a keymap to toggle aerial
	vim.keymap.set("n", "<leader>o", "<cmd>AerialToggle<CR>")
end

MiniDeps.later(setup)
