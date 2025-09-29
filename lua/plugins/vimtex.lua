MiniDeps.add("lervag/vimtex")

function setup()
  vim.g.vimtex_view_method = "skim"
end

MiniDeps.now(setup)
