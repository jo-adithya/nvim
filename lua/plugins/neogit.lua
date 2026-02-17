MiniDeps.add({
  source = "NeogitOrg/neogit",
  depends = {
    "nvim-lua/plenary.nvim",
  },
})

function setup()
  require("neogit").setup {
    graph_style = "kitty",
    integrations = {
      codediff = true,
      mini_pick = true,
    },
    diff_viewer = "codediff",
    file_watcher = {
      enabled = false,
    },
    auto_refresh = false,
    kind = "floating",
    floating = {
      width = 0.9,
      height = 0.85,
    },
    signs = {
      -- { CLOSED, OPENED }
      section = { "", "" },
      item = { "", "" },
      hunk = { "", "" },
    }
  }

  vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Open Neogit UI" })
end

MiniDeps.later(setup)
