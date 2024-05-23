local M = {
  "SmiteshP/nvim-navbuddy",
  dependencies = {
    "SmiteshP/nvim-navic",
    "MunifTanjim/nui.nvim",
  },
}

function M.config()
  local wk = require("which-key")
  wk.register({
    ["<leader>o"] = { "<cmd>Navbuddy<cr>", "Nav" },
  })

  local navbuddy = require("nvim-navbuddy")
  -- local actions = require("nvim-navbuddy.actions")
  navbuddy.setup({
    window = {
      border = "rounded",
    },
    lsp = { auto_attach = true },
  })

  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_set_keymap

  keymap("n", "<D-s>", ":silent only | Navbuddy<cr>", opts)
  keymap("n", "<D-o>", ":silent only | Navbuddy<cr>", opts)
end

return M
