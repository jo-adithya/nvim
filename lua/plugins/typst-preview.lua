MiniDeps.add("chomosuke/typst-preview.nvim")

function setup()
  require("typst-preview").setup({
    invert_colors = "always"
  })
end

MiniDeps.later(setup)
