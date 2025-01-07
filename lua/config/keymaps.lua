-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.keymap.del("n", "<leader>gG")
vim.keymap.del("n", "<leader>gs")

keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)

keymap("x", "p", [["_dP]])

-- more good
keymap({ "n", "o", "x" }, "<D-h>", "^", opts)
keymap({ "n", "o", "x" }, "<D-l>", "$", opts)

-- Move current line
keymap({ "n", "v" }, "<T-k>", ":m .-2<CR>==", opts)
keymap({ "n", "v" }, "<T-j>", ":m .+1<CR>==", opts)
keymap("i", "<T-j>", "<ESC> :m .+1<CR>==i", opts)
keymap("i", "<T-k>", "<ESC> :m .-2<CR>==i", opts)
keymap("x", "<T-j>", ":m '>+1<CR>gv=gv", opts)
keymap("x", "<T-k>", ":m '<-2<CR>gv=gv", opts)

-- Trouble
local open_float = ":lua vim.diagnostic.open_float(nil, {focus=true, border='rounded'})<CR>"
local prev_diag = ":lua vim.diagnostic.goto_prev({float = {border = 'rounded'}})<CR>"
local next_diag = ":lua vim.diagnostic.goto_next({float = {border = 'rounded'}})<CR>"

keymap("n", "gl", open_float, { noremap = true, silent = true, desc = "Open Diagnostic Float" })
keymap("n", "[d", prev_diag, { noremap = true, silent = true, desc = "Prev Diagnostic" })
keymap("n", "]d", next_diag, { noremap = true, silent = true, desc = "Next Diagnostic" })

-- LSP
keymap({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, { noremap = true, silent = true, desc = "Signature Help" })
keymap("n", "K", vim.lsp.buf.hover, opts)

keymap("i", "jk", "<ESC>", opts)

-- Git
keymap("n", "<leader>gG", "+Neogit", opts)
keymap("n", "<leader>gs", ":Neogit <CR>", opts)
keymap("n", "<leader>gGc", ":Neogit commit <CR>", opts)
keymap("n", "<leader>gGp", ":Neogit pull <CR>", opts)
keymap("n", "<leader>gGP", ":Neogit push <CR>", opts)
keymap("n", "<leader>gGb", ":Telescope git_branches<CR>", opts)

keymap("n", "<leader>a", ":lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(nil)) <CR>")

vim.api.nvim_set_keymap("t", "<C-;>", "<C-\\><C-n>", opts)
