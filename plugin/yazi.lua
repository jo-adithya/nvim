vim.pack.add({ "https://github.com/mikavilpas/yazi.nvim" })

-- Setup --

require("yazi").setup({
  open_for_directories = false,
  floating_window_scaling_factor = 0.8,
  yazi_floating_window_border = "rounded",
})

vim.keymap.set("n", "<leader>e", "<cmd>Yazi<cr>", { desc = "Open file explorer in current file" })
