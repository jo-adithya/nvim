MiniDeps.add("mfussenegger/nvim-lint")

function setup()
	require("lint").linters_by_ft = {
		typescript = { "eslint_d" },
		javascript = { "eslint_d" },
		svelte = { "eslint_d" },
	}

	-- Autocommands
	vim.api.nvim_create_autocmd({ "BufWritePost" }, {
		callback = function()
			-- try_lint without arguments runs the linters defined in `linters_by_ft`
			-- for the current filetype
			require("lint").try_lint()
		end,
	})
end

MiniDeps.later(setup)
