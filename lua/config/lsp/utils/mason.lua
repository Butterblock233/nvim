-- local get_cold_servers = require("utils.cold_servers").get_cold_lsp_servers
local M = {}

M.ensure_installed_server = { "lua-language-server", "basedpyright", "powershell-editor-services", "clangd", "ruff" }

-- function M.build_mason()
-- 	vim.cmd{cmd = "MasonInstall",args=M.ensure_installed_server}
-- end

function M.setup()
	-- 设置 mason
	require("mason").setup()
	require("mason-lspconfig").setup()
	-- require("mason")
end
return M
