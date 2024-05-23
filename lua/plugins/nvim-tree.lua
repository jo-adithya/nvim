return {
  -- Disable Neo-Tree
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },

  -- Add Nvim-Tree
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- local tree_cb = require("nvim-tree.config").nvim_tree_callback

      require("nvim-tree").setup({
        auto_reload_on_write = false,
        disable_netrw = false,
        hijack_cursor = true,
        hijack_netrw = true,
        hijack_unnamed_buffer_when_opening = false,
        sort_by = "name",
        root_dirs = {},
        prefer_startup_root = false,
        sync_root_with_cwd = true,
        reload_on_bufenter = false,
        respect_buf_cwd = false,
        on_attach = "default",
        select_prompts = false,
        update_focused_file = {
          enable = true,
          update_cwd = true,
        },
        renderer = {
          root_folder_modifier = ":t",
          icons = {
            git_placement = "after",
            modified_placement = "after",
            diagnostics_placement = "signcolumn",
            bookmarks_placement = "signcolumn",
            padding = " ",
            glyphs = {
              default = "",
              symlink = "",
              folder = {
                arrow_open = "",
                arrow_closed = "",
                default = "",
                open = "",
                empty = "",
                empty_open = "",
                symlink = "",
                symlink_open = "",
              },
              git = {
                unstaged = "",
                staged = "S",
                unmerged = "",
                renamed = "➜",
                untracked = "U",
                deleted = "",
                ignored = "◌",
              },
            },
          },
        },
        diagnostics = {
          enable = true,
          show_on_dirs = true,
          icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
          },
        },
        view = {
          width = 30,
          side = "left",
          -- mappings = {
          -- list = {
          -- { key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
          -- { key = "h", cb = tree_cb("close_node") },
          -- { key = "v", cb = tree_cb("vsplit") },
          -- },
          -- },
        },
      })
    end,
    keys = {
      {
        "<leader>e",
        function()
          vim.cmd([[NvimTreeToggle]])
        end,
        mode = { "n", "t" },
        desc = "Toggle nvim-tree",
      },
      {
        "<C-f>",
        function()
          vim.cmd([[NvimTreeFindFile]])
        end,
        desc = "Show current file in nvim-tree",
      },
    },
  },
}
