local M = {}
-- Cold_servers.lua
-- get all servers installed by mason but have not been set up by vim.lsp.enable() and return as a list.
function M.get_installed_lsp_servers()
	local registry = require("mason-registry")
	local packages = registry.get_all_packages()

	local lsp_servers = {}
	for _, package in ipairs(packages) do
		if package.type == "lsp" and package:is_installed() then
			table.insert(lsp_servers, package.name)
		end
	end

	return lsp_servers
end

function M.get_enabled_lsp_servers()
	return vim.tbl_keys(vim.lsp._enabled_configs)
end

function M.mason_to_lsp_name(mason_name)
	if mason_name == "lua-language-server" then
		return "lua_ls"
	elseif mason_name == "powershell-editor-service" then
		return "powershell_es"
	end
	local server_name = mason_name:gsub("-language-server$", ""):gsub("-", "_")
	return server_name
end

function M.get_unset_lsp_servers()
	local installed = M.get_installed_lsp_servers()
	local enabled = M.get_enabled_lsp_servers()

	local enabled_map = {}
	for _, name in ipairs(enabled) do
		enabled_map[name] = true
	end

	local unset_servers = {}
	for _, mason_pkg in ipairs(installed) do
		local server_name = M.mason_to_lsp_name(mason_pkg)
		if not enabled_map[server_name] then
			table.insert(unset_servers, server_name)
		end
	end

	return unset_servers
end
-- vim.print(M.get_installed_lsp_servers())
-- vim.print(M.get_enabled_lsp_servers())
-- vim.print(M.get_unset_lsp_servers())
return M
