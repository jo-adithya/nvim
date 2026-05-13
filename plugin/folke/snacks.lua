vim.pack.add({ "https://github.com/folke/snacks.nvim" })

local Snacks = require("snacks")
Snacks.setup({
  picker = {
    enabled = true,
    win = {
      input = {
        keys = {
          ["<a-s>"] = { "flash", mode = { "n", "i" } },
          ["s"] = { "flash" },
        },
      },
    },
    actions = {
      flash = function(picker)
        require("flash").jump({
          pattern = "^",
          label = { after = { 0, 0 } },
          search = {
            mode = "search",
            exclude = {
              function(win)
                return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "snacks_picker_list"
              end,
            },
          },
          action = function(match)
            local idx = picker.list:row2idx(match.pos[1])
            picker.list:_move(idx, true, true)
          end,
        })
      end,
    },
  },
  indent = {
    enabled = true,
  },
  bigfile = { enabled = true },
  quickfile = { enabled = true },
  zen = {
    enabled = true,
    toggles = {
      dim = true,
      git_signs = true,
      mini_diff_signs = true,
      diagnostics = true,
      inlay_hints = false,
    },
    show = { statusline = true, tabline = true },
  },
})

vim.schedule(function()
  local wk = require("which-key")
  wk.add({
    {
      "<leader><space>",
      function()
        Snacks.picker.smart()
      end,
      desc = "Smart Find Files",
    },
    {
      "<leader>,",
      function()
        Snacks.picker.buffers({
          on_show = function()
            vim.cmd.stopinsert()
          end,
          win = {
            input = {
              keys = {
                ["d"] = "bufdelete",
              },
            },
            list = { keys = { ["d"] = "bufdelete" } },
          },
        })
      end,
      desc = "Buffers",
    },
  })
  wk.add({
    "<leader>/",
    function()
      Snacks.picker.grep()
    end,
    desc = "Grep",
  })
  wk.add({
    "<leader>:",
    function()
      Snacks.picker.command_history()
    end,
    desc = "Command History",
  })
  wk.add({
    "<leader>n",
    function()
      Snacks.picker.notifications()
    end,
    desc = "Notification History",
  })
end)
