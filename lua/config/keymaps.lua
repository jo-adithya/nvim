local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("x", "p", [["_dP]])

-- more good
keymap({ "n", "o", "x" }, "<D-h>", "^", opts)
keymap({ "n", "o", "x" }, "<D-l>", "$", opts)
keymap({ "n", "o", "x" }, "gh", "^", { desc = "Go to start of line" })
keymap({ "n", "o", "x" }, "gl", "$", { desc = "Go to end of line" })

-- Move current line
keymap({ "n", "v" }, "˚", ":m .-2<CR>==", opts)
keymap({ "n", "v" }, "∆", ":m .+1<CR>==", opts)
keymap("i", "∆", "<ESC> :m .+1<CR>==i", opts)
keymap("i", "˚", "<ESC> :m .-2<CR>==i", opts)
keymap("x", "∆", ":m '>+1<CR>gv=gv", opts)
keymap("x", "˚", ":m '<-2<CR>gv=gv", opts)
keymap({ "n", "v" }, "<A-k>", ":m .-2<CR>==", opts)
keymap({ "n", "v" }, "<A-j>", ":m .+1<CR>==", opts)
keymap("i", "<A-j>", "<ESC> :m .+1<CR>==i", opts)
keymap("i", "<A-k>", "<ESC> :m .-2<CR>==i", opts)
keymap("x", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("x", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Visual Mode Indent
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- LSP
keymap({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, { noremap = true, silent = true, desc = "Signature Help" })

keymap("i", "jk", "<ESC>:w<CR>", opts)
keymap("i", "jj", "<ESC>", opts)

-- Windows
keymap("n", "<leader>|", ":vsplit<CR>", { desc = "Vertical split" })
keymap("n", "<leader>-", ":split<CR>", { desc = "Horizontal split" })

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
