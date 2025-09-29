MiniDeps.add('nvim-mini/mini.hipatterns')

function setup()
  require('mini.hipatterns').setup()
end

MiniDeps.later(setup)
