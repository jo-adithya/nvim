vim.pack.add({ {
	src = "https://github.com/nvim-treesitter/nvim-treesitter",
	version = "main",
} })

-- Setup --

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
	"typst",
	"lua",
	"python",
	"sql",
	"svelte",
	"typescript",
	"tsx",
	"rust",
	"ron",
	"markdown",
	"markdown_inline",
	"yaml",
  "vim",
  "vimdoc",
}

require("nvim-treesitter").setup()

require("nvim-treesitter").install(filetypes)

-- Autocommand
vim.api.nvim_create_autocmd("FileType", {
	pattern = filetypes, -- Add any other filetypes you use
	callback = function()
		-- Start Tree-sitter highlighting
		vim.treesitter.start()

		-- Enable Tree-sitter-based folding
		vim.wo.foldmethod = "expr"
		vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
	end,
})
