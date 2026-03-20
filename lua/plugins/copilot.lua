MiniDeps.add("zbirenbaum/copilot.lua")


function setup()
  require("copilot").setup({
    panel = {
      enabled = false,
    },
    suggestion = {
      enabled = false,
    },
    filetypes = {
      markdown = true,
      help = true,
    }
  })
end

MiniDeps.later(setup)
