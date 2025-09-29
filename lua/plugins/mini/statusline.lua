MiniDeps.add('nvim-mini/mini.statusline')

function setup()
  require("mini.statusline")
end

MiniDeps.now(setup)
