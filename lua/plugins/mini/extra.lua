MiniDeps.add("nvim-mini/mini.extra")

local function setup()
  require("mini.extra").setup()

  vim.keymap.set("n", "<leader>fs", "<cmd>Pick lsp scope='document_symbol'<CR>", { desc = "Find LSP symbols" })
  vim.keymap.set("n", "gR", "<cmd>Pick lsp scope='references'<CR>", { desc = "Find references" })
  vim.keymap.set("n", "<leader>fd", "<cmd>Pick diagnostic<CR>", { desc = "Find diagnostics" })
  vim.keymap.set("n", "<leader>D", "<cmd>Pick diagnostic<CR>", { desc = "Find diagnostics" })
end

MiniDeps.later(setup)
