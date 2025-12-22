MiniDeps.add({
  source = "NeogitOrg/neogit",
  depends = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim"
  },
})

function setup()
  require("neogit").setup {
    graph_style = "kitty",
    integrations = {
      diffview = true,
      mini_pick = true,
    }
  }
end

MiniDeps.later(setup)
