MiniDeps.add("chomosuke/typst-preview.nvim")

function setup()
  require("typst-preview").setup()
end

MiniDeps.later(setup)
