-- local get_cold_servers = require("utils.cold_servers").get_cold_lsp_servers
local M = {}
function M.setup()
	-- 设置 mason
	require("mason").setup()
	require("mason-lspconfig").setup()
	-- require("mason")
end
return M
