MiniDeps.add('nvim-mini/mini.indentscope')

function setup()
  require("mini.indentscope").setup()
end

MiniDeps.later(setup)
