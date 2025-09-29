MiniDeps.add('nvim-mini/mini.notify')

local function setup()
  require("mini.notify").setup({
    content = {
      format = function(notif)
        local icons = {
          ERROR = "   ",
          WARN = "   ",
          INFO = "   ",
          DEBUG = "   ",
        }
        return icons[notif.level] .. notif.msg
      end
    },
    window = {
      config = {
        -- width = 50,
        border = "rounded"
      },
      winblend = 0,
    }
  })
end

MiniDeps.later(setup)
