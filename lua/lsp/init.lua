local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
local mini_capabilities = MiniCompletion.get_lsp_capabilities()
local capabilities = vim.tbl_deep_extend("force", lsp_capabilities, mini_capabilities)

local function enable_lsp()
  vim.lsp.enable({
    -- Bash
    "bashls",

    -- Lua
    "emmylua_ls",

    -- Python
    "basedpyright",
    "ruff",

    -- Typescript/Javascript/Svelte
    "vtsls", 
    "svelteserver", 
    "biome",
    "tailwindcss",
    "cssls",

    -- Typst
    "tinymist",

    -- Rust
    "rust_analyzer",
  })
end

---@diagnostic disable-next-line: param-type-not-match
vim.lsp.config("*", {
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		-- keymaps
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Buffer declarations" })
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
		vim.keymap.set("n", "gK", vim.lsp.buf.signature_help, { desc = "View signature" })
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "View definition" })
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Get implementation" })
		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, { desc = "Add workspace to folder" })
		vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, { desc = "remove workspace from folder" })
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, { desc = "List workspace folders" })
		vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, { desc = "Code action" })
		-- vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = "Get references" })
		vim.keymap.set("n", "<leader>d", function()
			vim.diagnostic.open_float({ bufnr = 0, border = "rounded" })
		end, { desc = "Open diagnostic on current line" })
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.jump({ count = -1, float = { border = "rounded" } })
		end, { desc = "Jump to next diagnostic" })
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.jump({ count = 1, float = { border = "rounded" } })
		end, { desc = "Jump to previous diagnostic" })
		vim.keymap.set("n", "<space>q", function()
			vim.diagnostic.setloclist({ open = false })
			local window = vim.api.nvim_get_current_win()
			vim.cmd.lwindow()
			vim.api.nvim_set_current_win(window)
		end, { desc = "Set diagnostic list" })
		-- vim.keymap.set('n', '<space>cf', function()
		--   vim.lsp.buf.format({ async = true, })
		-- end, { desc = "Format document" })
	end,
})

enable_lsp()
