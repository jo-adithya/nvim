vim.diagnostic.config({
  update_in_insert = false,
  virtual_text = false,
  -- virtual_text = {
  -- 	source = true,
  -- 	prefix = function(_diagnostic, index, _total)
  -- 		return index == 1 and " " or ""
  -- 	end,
  --    current_line = false,
  -- },
  virtual_lines = false,
  underline = true,
  update_in_insert = true,
  severity_sort = true,
  signs = false,
  -- signs = {
  -- 	text = {
  -- 		[vim.diagnostic.severity.ERROR] = " ",
  -- 		[vim.diagnostic.severity.WARN] = " ",
  -- 		[vim.diagnostic.severity.INFO] = " ",
  -- 		[vim.diagnostic.severity.HINT] = " ",
  -- 	},
  -- 	numhl = {
  -- 		[vim.diagnostic.severity.ERROR] = "DiagnosticVirtualTextError",
  -- 		[vim.diagnostic.severity.WARN] = "DiagnosticVirtualTextWarn",
  -- 		[vim.diagnostic.severity.INFO] = "DiagnosticVirtualTextInfo",
  -- 		[vim.diagnostic.severity.HINT] = "DiagnosticVirtualTextHint",
  -- 	},
  -- },
  float = {
    border = "rounded",
    source = "if_many",
  },
  underline = { severity = { min = "HINT", max = "ERROR" } },
})

vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = "Red" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = "Yellow" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = "Blue" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = "Green" })
