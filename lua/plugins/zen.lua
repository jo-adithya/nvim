MiniDeps.add("folke/zen-mode.nvim")

function setup()
  require("zen-mode").setup()
end

MiniDeps.later(setup)
