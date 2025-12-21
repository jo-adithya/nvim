---@brief
---
--- https://github.com/MathiasPius/crates-lsp/
---
--- Language Server implementation for Cargo.toml
---

---@type vim.lsp.Config
return {
	cmd = { "crates-lsp" },
	filetypes = { "toml" },
	root_markers = { "Cargo.toml", ".git" },
}
