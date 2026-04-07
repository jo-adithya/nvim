vim.api.nvim_create_autocmd("FileType", {
	once = true,
	pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact", "svelte" },
	callback = function()
		vim.pack.add({"https://github.com/dmmulroy/ts-error-translator.nvim"})

    -- Setup --

	require("ts-error-translator").setup({
		-- Auto-attach to LSP servers for TypeScript diagnostics (default: true)
		auto_attach = true,

		-- LSP server names to translate diagnostics for (default shown below)
		servers = {
			"astro",
			"svelteserver",
			"ts_ls",
			"typescript-tools",
			"volar",
			"vtsls",
			"tsgo",
		},
	})
	end,
})
