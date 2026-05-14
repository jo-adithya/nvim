local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("x", "p", [["_dP]])
keymap("n", "j", "gj")
keymap("n", "k", "gk")

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
keymap("n", "<leader>|", function()
  vim.cmd("vsplit")
  vim.cmd("wincmd l")
end, { desc = "Vertical split and focus" })
keymap("n", "<leader>-", function()
  vim.cmd("split")
  vim.cmd("wincmd j")
end, { desc = "Horizontal split and focus" })
keymap("n", "<A-Left>", "<C-w><", { desc = "Decrease window width" })
keymap("n", "<A-Right>", "<C-w>>", { desc = "Increase window width" })
keymap("n", "<A-Up>", "<C-w>+", { desc = "Increase window height" })
keymap("n", "<A-Down>", "<C-w>-", { desc = "Decrease window height" })

keymap("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
keymap("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })
keymap("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })
keymap("n", "<leader>nh", ":nohlsearch<CR>", { desc = "Clear search highlight" })

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
