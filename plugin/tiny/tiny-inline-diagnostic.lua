vim.pack.add({ "https://github.com/rachartier/tiny-inline-diagnostic.nvim" })

-- Setup --

vim.api.nvim_create_autocmd("BufEnter", {
  once = true,
  callback = function()
    require("tiny-inline-diagnostic").setup({
      options = {
        multilines = {
          enabled = true,
        },
      },
    })
  end,
})
