MiniDeps.add('nvim-mini/mini.pairs')

function setup()
  require('mini.pairs').setup()
end

MiniDeps.later(setup)
