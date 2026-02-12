local M = {}

-- local lspconfig = require("lspconfig")
-- local lspconfig = {}
M.opts = {}

function M.setup() end
M.keymaps = {
	{ "gD", vim.lsp.buf.declaration, desc = "Go to declaration" },
	{ "gd", vim.lsp.buf.definition, desc = "Go to definition" },
	{ "K", vim.lsp.buf.hover, desc = "Show infomation" },
	{ "gI", vim.lsp.buf.implementation, desc = "Go to implementation" },
	{ "<C-k>", vim.lsp.buf.signature_help, desc = "Show help" },
	{ "<leader>D", vim.lsp.buf.type_definition },
	{ "<leader>rn", vim.lsp.buf.rename, desc = "Rename" },
	{ mode = "n", "gR", vim.lsp.buf.references },
}
return M
