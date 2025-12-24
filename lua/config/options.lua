local options = {
	winborder = "rounded",
	pumborder = "rounded",
	foldcolumn = "0",
	foldlevel = 99,
	foldlevelstart = 99,
	foldenable = true,
	foldmethod = "indent",
	statuscolumn = "%=%{v:relnum?v:relnum:v:lnum}   ",
	signcolumn = "yes:1",
	relativenumber = true,
	expandtab = true,
	shiftwidth = 2, -- Size of indent when using >> or <<
	tabstop = 2, -- Number of spaces a <Tab> appears as
	softtabstop = 2, -- Number of spaces <Tab> inserts in insert mode
	backup = false, -- creates a backup file
	clipboard = "unnamedplus", -- allows neovim to access the system clipboard
	fileencoding = "utf-8", -- the encoding written to a file
	hlsearch = true, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns
	mouse = "a", -- allow the mouse to be used in neovim
	showtabline = 2, -- always show tabs
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	numberwidth = 3, -- set number column width to 2 {default 4}
	wrap = true, -- display lines as one long line
	linebreak = true, -- companion to wrap, don't split words
	scrolloff = 8, -- minimal number of screen lines to keep above and below the cursor
	sidescrolloff = 8, -- minimal number of screen columns either side of cursor if wrap is `false`
	whichwrap = "bs<>[]hl", -- which "horizontal" keys are allowed to travel to prev/next line
	pumblend = 0,
	termguicolors = true,
	swapfile = false,
	autoread = true,
	cursorline = true,
	inccommand = "nosplit",
	fillchars = { vert = " ", eob = " ", diff = " ", fold = " ", foldopen = "▾", foldclose = "▸", foldsep = "│" },
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- vim.opt.shortmess = "ilmnrx"                        -- flags to shorten vim messages, see :help 'shortmess'
vim.opt.shortmess:append("c") -- don't give |ins-completion-menu| messages
vim.opt.iskeyword:append("-") -- hyphenated words recognized by searches
vim.opt.formatoptions:remove({ "c", "r", "o" }) -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles") -- separate vim plugins from neovim in case vim still in use
vim.g.mapleader = " "
