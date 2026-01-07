MiniDeps.add({
	source = "nvim-treesitter/nvim-treesitter",
	checkout = "main",
})

local filetypes = {
  "css",
	"fish",
	"git_config",
	"git_rebase",
	"gitattributes",
	"gitcommit",
	"gitignore",
	"html",
	"html_tags",
	"javascript",
	"jsx",
	"latex",
	"lua",
	"python",
	"sql",
	"svelte",
	"typescript",
  "typescriptreact",
  "rust",
}

function setup()
	require("nvim-treesitter").setup()

	require("nvim-treesitter").install(filetypes)

	-- Autocommand
	vim.api.nvim_create_autocmd("FileType", {
		pattern = filetypes, -- Add any other filetypes you use
		callback = function()
			-- Start Tree-sitter highlighting
			vim.treesitter.start()

			-- Enable Tree-sitter-based folding
			-- vim.wo.foldmethod = "expr"
			-- vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		end,
	})
end

MiniDeps.now(setup)
