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

  wk.add({
    "<leader>ft",
    function()
      local date = vim.fn.strftime("%Y-%m-%d")
      Snacks.picker.grep({
        on_show = function(picker)
          vim.cmd.stopinsert()
        end,
        search = "^- \\[[ x]\\]",
        prompt = "  ",
        dirs = { vim.fn.expand("~/documents/personal/ideaverse/01-daily-notes/") },
        regex = true,
        live = false,
        glob = date .. ".md",
        finder = "grep",
        show_empty = true,
        format = function(item, ctx)
          local line = item.line or ""
          local checked = line:match("%- %[x%]")
          local rest = line:match("%- %[.%] (.*)")

          if rest then
            local icon = checked and "   " or "   "
            local hl = checked and "DiagnosticOk" or "DiagnosticError"
            return {
              { icon, hl },
              { rest, "Normal" },
            }
          end
          return { { line, "Normal" } }
        end,
        formatters = {
          file = { filename = "hidden" },
        },
        actions = {
          toggle_todo = function(picker, item)
            if not item then
              return
            end

            local cursor = picker.list.cursor -- save position

            local line = item.line
            local new_line
            if line:match("%- %[ %]") then
              new_line = line:gsub("%- %[ %]", "- [x]", 1)
            else
              new_line = line:gsub("%- %[x%]", "- [ ]", 1)
            end
            -- replace the line in the file
            local buf = vim.fn.bufadd(item.file)
            vim.fn.bufload(buf)
            vim.api.nvim_buf_set_lines(buf, item.pos[1] - 1, item.pos[1], false, { new_line })
            vim.api.nvim_buf_call(buf, function()
              vim.cmd("silent write")
            end)

            picker:find({
              on_done = function()
                picker.list:move(cursor - 1) -- restore position
              end,
            })
          end,
        },
        win = {
          input = {
            keys = {
              ["<space>"] = "toggle_todo",
            },
            wo = {
              winbar = "",
            },
          },
          list = {
            keys = {
              ["<space>"] = "toggle_todo",
            },
          },
        },
        layout = {
          ---@diagnostic disable-next-line: missing-fields
          layout = {
            box = "vertical", -- root box required
            backdrop = false,
            width = 0.5,
            height = 0.6,
            border = true,
            -- title = " Tasks ",
            -- title_pos = "center",
            {
              win = "input",
              height = 1,
              title = "Tasks",
              title_pos = "center",
              -- border = false,
              border = { " ", " ", " ", " ", " ", " ", " ", " " },
            },
            {
              win = "list",
              -- title = " Tasks ",
              -- title_pos = "left",
              border = false,
              -- border = { " ", " ", " ", " ", " ", " ", " ", " " },
            },
          },
        },
      })
    end,
    desc = "Find todos",
  })
end)
