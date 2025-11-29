MiniDeps.add("stevearc/conform.nvim")

function setup()
  local util = require("conform.util");

	require("conform").setup({
    formatters = {
      ["biome-check"] = {
        args = { "check", "--write", "--unsafe", "--stdin-file-path", "$FILENAME" },
      }
    },
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform will run multiple formatters sequentially
			python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
			-- You can customize some of the format options for the filetype (:help conform.format)
			rust = { "rustfmt", lsp_format = "fallback" },
			-- Conform will run the first available formatter
			javascript = { "biome-check" },
			typescript = { "biome-check" },
			typescriptreact = { "biome-check" },
			svelte = { "prettierd" },
			json = { "biome-check" },
			typst = { "typstyle" },
			sh = { "shfmt" },
		},

		vim.keymap.set("n", "<leader>cf", function()
			require("conform").format()
		end, { desc = "Format document" }),
	})
end

MiniDeps.later(setup)
