local M = {}

M.opts = {
	automatic_enable = {
		-- The following servers are manually configured
		exclude = {
			"lua_ls",
			"basedpyright",
			"powershell_es",
			"ruff",
			"sourcekit",
			"nu",
			"ty",
		},
	},
	ensure_installed = {
		"basedpyright",
		"lua_ls",
		"ruff",
	},
}

return M
