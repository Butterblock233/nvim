local M = {}
-- Cold_servers.lua
-- get all servers installed by mason but have not been set up by vim.lsp.enable() and return as a list.
function M._mason_to_lsp_name(mason_name)
	-- Parameter validation
	-- input: mason lsp server name
	-- output: lspconfig server name
	if type(mason_name) ~= "string" or mason_name == "" then
		vim.notify(string.format("Invalid mason_name: %s", vim.inspect(mason_name)), vim.log.levels.ERROR)
		return nil
	end

	-- Get official mappings (with caching mechanism)
	local ok, mappings = pcall(function()
		return require("mason-lspconfig").get_mappings()
	end)

	if not ok then
		vim.notify("Failed to get mason-lspconfig mappings: " .. mappings, vim.log.levels.ERROR)
		return mason_name
	end

	-- Prefer official mappings
	local lsp_name = mappings.mason_to_lspconfig[mason_name]

	-- Special handling: package names with version (e.g. "rust-analyzer@nightly")
	if not lsp_name and mason_name:match("@") then
		local base_name = mason_name:gsub("@.+$", "")
		lsp_name = mappings.mason_to_lspconfig[base_name]
	end

	-- Final fallback logic
	return lsp_name or mason_name
end
function M._get_installed_lsp_servers()
	local registry = require("mason-registry")

	-- 1. Get all package specs (including category info)
	local specs = registry.get_all_package_specs()

	-- 2. Get installed package names (quick check)
	local installed_names = registry.get_installed_package_names()

	-- 3. Filtering logic
	local lsp_servers = {}
	for _, spec in ipairs(specs) do
		-- Check: category contains LSP and is installed
		if
			spec.categories
			and vim.tbl_contains(spec.categories, "LSP")
			and vim.tbl_contains(installed_names, spec.name)
		then
			-- table.insert(lsp_servers, spec.name)
			table.insert(lsp_servers, M._mason_to_lsp_name(spec.name))
		end
	end

	return lsp_servers
end

function M._get_enabled_lsp_servers()
	-- Get LSP servers enabled by vim.lsp.enable()
	return vim.tbl_keys(vim.lsp._enabled_configs)
end

function M.get_cold_lsp_servers()
	-- Get all LSP servers installed but not enabled by vim.lsp.enable()
	local installed = M._get_installed_lsp_servers()
	local enabled = M._get_enabled_lsp_servers()

	local enabled_map = {}
	for _, name in ipairs(enabled) do
		enabled_map[name] = true
	end

	local unset_servers = {}
	for _, mason_pkg in ipairs(installed) do
		local server_name = M._mason_to_lsp_name(mason_pkg)
		if not enabled_map[server_name] then
			table.insert(unset_servers, server_name)
		end
	end

	return unset_servers
end
function M.debug()
	--- Debugging function to print all LSP servers and their status.
	-- Get data
	local installed_servers = M._get_installed_lsp_servers() or {}
	local enabled_servers = M._get_enabled_lsp_servers() or {}
	local cold_servers = M.get_cold_lsp_servers() or {}

	-- Calculate not enabled servers
	local installed_not_enabled = vim.tbl_filter(function(server)
		return not vim.tbl_contains(enabled_servers, server)
	end, installed_servers)

	-- Compact table output function
	local function print_table_section(icon, label, items, max_columns)
		max_columns = max_columns or 3 -- 默认每行3列
		local count = #items
		local header = string.format("%s %s (%d):", icon, label, count)

		-- Print header
		vim.print(header)

		-- Print content in groups
		if count > 0 then
			local grouped = {}
			for i = 1, count do
				local col = (i - 1) % max_columns + 1
				local row = math.floor((i - 1) / max_columns) + 1
				grouped[row] = grouped[row] or {}
				grouped[row][col] = items[i]
			end

			-- Print table content
			for _, row in ipairs(grouped) do
				local line = "  "
				for _, item in ipairs(row) do
					line = line .. string.format("%-20s", item)
				end
				vim.print(line)
			end
		else
			vim.print("  (none)")
		end
		print() -- Seperate with an empty line
	end

	-- Output each category (with icons)
	print_table_section("■", "Installed", installed_servers)
	print_table_section("✔", "Enabled", enabled_servers)
	print_table_section("○", "Cold", cold_servers)
	-- print_table_section("!", "Not Enabled", installed_not_enabled)
end
return M
