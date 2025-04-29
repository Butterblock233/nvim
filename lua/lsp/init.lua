local M = {}
vim.lsp.config("*", {
	capabilities = {
		textDocument = {
			semanticTokens = {
				multilineTokenSupport = true,
			},
		},
	},
	root_markers = { ".git" },
})

vim.lsp.enable({
	"clangd",
	"lua_ls",
	"pwsh",
	"pyright",
})

return M
