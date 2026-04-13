vim.pack.add({ "https://github.com/MeanderingProgrammer/render-markdown.nvim" })

-- Setup --

vim.api.nvim_create_autocmd("FileType", {
  once = true,
  pattern = "markdown",
  callback = function()
    require("render-markdown").setup({
      completions = { lsp = { enabled = true } },
      code = {
        left_pad = 2,
        language_pad = 2,
        border = "thick",
      },
      heading = {
        border = true,
        icons = { "# ", "## ", "### ", "#### ", "##### ", "###### " },
        left_pad = 2,
        -- border_virtual = true,
      },
      checkbox = {
        unchecked = { icon = "󱥸 " },
        checked = { icon = " " },
        left_pad = 1,
        right_pad = 2,
      },
      dash = {
        width = 20,
        left_margin = 0.5,
      },
      pipe_table = { preset = "double", alignment_indicator = "┅" },
      bullet = {
        left_pad = 1,
        right_pad = 2,
      },
    })
  end,
})

function setup() end
