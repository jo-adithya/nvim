MiniDeps.add("sindrets/diffview.nvim")

function setup()
  require("diffview").setup({
    enhanced_diff_hl = true,
    show_icons = true,
  })

  -- vim.keymap.set("n", "<leader>dv", function()
  --   require("diffview").open()
  -- end, { desc = "Open Diffview" })
  --
  -- vim.keymap.set("n", "<leader>dc", function()
  --   require("diffview").close()
  -- end, { desc = "Close Diffview" })
end

MiniDeps.later(setup)
