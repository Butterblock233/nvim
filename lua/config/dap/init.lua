local M = {}

function M.setup()
	require("config.dap.adapters").setup()
	require("config.dap.configurations").setup()
end
return M
