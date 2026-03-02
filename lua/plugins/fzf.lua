MiniDeps.add("ibhagwan/fzf-lua")

MiniDeps.later(function()
  require("fzf-lua").setup({
    globals = {
      preview_pager = "difftastic",
    },
    fzf_opts   = {
      ["--layout"] = "default",
    },
    winopts = {
      height = 0.8,
      row = 0.5,
      preview = {
        layout = "flex",
        vertical = "up:45%",
      }
    },
    git = {
      status = {
      }
    }
  })

  local wk = require("which-key")
  wk.add({
    { "<leader><space>", "<cmd>FzfLua global<cr>", desc = "Find global files" },
    { "<leader>/", "<cmd>FzfLua live_grep<cr>", desc = "Find global files" },
    { "<leader>f", group = "Find", icon = { icon = "", color = "blue" } },
    { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find files" },
    { "<leader>fg", "<cmd>FzfLua live_grep_resume<cr>", desc = "Resume live grep" },
    { "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Find buffers" },
    { "<leader>fm", "<cmd>FzfLua marks<cr>", desc = "Find marks" },
    { "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Find recent files" },
    { "<leader>fd", "<cmd>FzfLua document_diagnostics<cr>", desc = "Find document diagnostics" },
    { "<leader>fD", "<cmd>FzfLua workspace_diagnostics<cr>", desc = "Find workspace diagnostics" },
    { "<leader>fg", group = "Find git" },
    { "<leader>fgs", "<cmd>FzfLua git_status<cr>", desc = "Git status" },
    { "<leader>fgb", "<cmd>FzfLua git_branches<cr>", desc = "Git branches" },
    { "<leader>fgl", "<cmd>FzfLua git_commits<cr>", desc = "Git log" },
    { "<leader>fgd", "<cmd>FzfLua git_diff<cr>", desc = "Git diff" },

    { "gr", "<cmd>FzfLua lsp_definitions     jump1=true ignore_current_line=true<cr>", desc = "Goto Definition" },
    { "gr", "<cmd>FzfLua lsp_references      jump1=true ignore_current_line=true<cr>", desc = "References", nowait = true },
    { "gI", "<cmd>FzfLua lsp_implementations jump1=true ignore_current_line=true<cr>", desc = "Goto Implementation" },
    { "gy", "<cmd>FzfLua lsp_typedefs        jump1=true ignore_current_line=true<cr>", desc = "Goto T[y]pe Definition" },

    { "<leader>c", group = "Code", icon = { icon = "", color = "blue" } },
    { "<leader>ca", "<cmd>FzfLua lsp_code_actions ignore_current_line=true<cr>", desc = "Code Actions 1" },
    { "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Code Rename" },

    { "gd", "<cmd>FzfLua lsp_definitions jump1=true ignore_current_line=true<cr>", desc = "Go to definition" },
    { "gD", "<cmd>FzfLua lsp_declarations jump1=true ignore_current_line=true<cr>", desc = "Buffer declarations" },
  })
  vim.cmd("FzfLua register_ui_select")
end)
