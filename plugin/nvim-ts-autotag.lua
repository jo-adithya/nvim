vim.pack.add({ "https://github.com/windwp/nvim-ts-autotag" })

-- Setup --

vim.api.nvim_create_autocmd("FileType", {
  once = true,
  pattern = { "html", "javascriptreact", "typescriptreact", "svelte" },
  callback = function()
    require("nvim-ts-autotag").setup({
      opts = {
        -- Defaults
        enable_close = true, -- Auto close tags
        enable_rename = true, -- Auto rename pairs of tags
        enable_close_on_slash = false, -- Auto close on trailing </
      },
    })
  end,
})
