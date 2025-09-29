MiniDeps.add('nvim-mini/mini.snippets')

function setup()
  require("mini.snippets").setup()
end

MiniDeps.later(setup)
