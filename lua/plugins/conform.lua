MiniDeps.add("stevearc/conform.nvim")

function setup()
	require("conform").setup({
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform will run multiple formatters sequentially
			python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
			-- You can customize some of the format options for the filetype (:help conform.format)
			rust = { "rustfmt", lsp_format = "fallback" },
			-- Conform will run the first available formatter
			javascript = { "biome", stop_after_first = true },
			typescript = { "prettierd" },
			typescriptreact = { "biome" },
			svelte = { "prettierd" },
			json = { "prettierd" },
			typst = { "typstyle" },
      sh = { "shfmt" },
		},

		vim.keymap.set("n", "<leader>cf", function()
			require("conform").format()
		end, { desc = "Format document" }),
	})
end

MiniDeps.later(setup)
