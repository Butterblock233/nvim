local M = {}


function M.setup()
	-- 设置 mason
	local lspconfig = require("lspconfig")
	require("mason-lspconfig").setup_handlers({
		-- 默认处理器（可选）
		function(server_name) -- 自动安装的 LSP 服务器会这样设置；server_name represents mason-lspconfig.nvim known server name
			lspconfig[server_name].setup {}
		end,

		-- 覆盖默认处理器（示例）
		-- ["lua_ls"] = function()
		-- end,
	})
end

return M
