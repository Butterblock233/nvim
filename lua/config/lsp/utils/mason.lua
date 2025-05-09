local get_cold_servers = require("utils.cold_servers").get_cold_lsp_servers
local M = {}
function M.setup()
	-- 设置 mason
	local lspconfig = require("lspconfig")
	require("mason-lspconfig").setup_handlers({
		-- Disable default handers
		-- function(server_name) -- 自动安装的 LSP 服务器会这样设置；server_name represents mason-lspconfig.nvim known server name
		-- 	lspconfig[server_name].setup({})
		-- end,

		-- 覆盖默认处理器（示例）
		-- ["lua_ls"] = function()
		-- end,
	})
	local cold_servers = get_cold_servers()
	for _, server_name in ipairs(cold_servers) do
		if lspconfig[server_name] then
			lspconfig[server_name].setup({})
		else
			vim.notify("LSP server not found: " .. server_name)
		end
	end
end

return M
