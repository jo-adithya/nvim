vim.diagnostic.config({
	virtual_text = {
		source = "if_many",
		prefix = function(_diagnostic, index, _total)
			return index == 1 and " " or ""
		end,
	},
	underline = true,
	update_in_insert = true,
	severity_sort = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.INFO] = " ",
			[vim.diagnostic.severity.HINT] = " ",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "DiagnosticVirtualTextError",
			[vim.diagnostic.severity.WARN] = "DiagnosticVirtualTextWarn",
			[vim.diagnostic.severity.INFO] = "DiagnosticVirtualTextInfo",
			[vim.diagnostic.severity.HINT] = "DiagnosticVirtualTextHint",
		},
	},
	float = {
		border = "rounded",
		source = "if_many",
	},
})
