vim.pack.add({ "https://github.com/MeanderingProgrammer/render-markdown.nvim" })

-- Setup --

vim.api.nvim_create_autocmd("FileType", {
  once = true,
  pattern = "markdown",
  callback = function()
    require("render-markdown").setup({
      render_modes = true,
      completions = { lsp = { enabled = true } },
      code = {
        left_pad = 2,
        language_pad = 2,
        min_width = 80,
        border = "thick",
      },
      heading = {
        border = false,
        -- icons = { "# ", "## ", "### ", "#### ", "##### ", "###### " },
        position = "inline",
        left_pad = 1,
        -- border_virtual = true,
      },
      checkbox = {
        unchecked = { icon = " " },
        checked = { icon = " " },
        left_pad = 1,
        right_pad = 2,
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
