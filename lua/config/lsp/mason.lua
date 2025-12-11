local M = {}

M.ensure_installed_server = { "lua-language-server", "basedpyright", "powershell-editor-services", "clangd", "ruff" }

function M.setup()
	require("mason").setup()
	require("mason-lspconfig").setup()
	-- if not vim.env.IS_NIXOS == "true" then
	-- 	require("mason").setup()
	-- 	require("mason-lspconfig").setup()
	-- end
end
return M
