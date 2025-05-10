local M = {}

-- 获取 Mason 到 LSP 的映射（适配 Mason 2.0）
function M._mason_to_lsp_name(mason_name)
    if type(mason_name) ~= "string" or mason_name == "" then
        vim.notify(string.format("Invalid mason_name: %s", vim.inspect(mason_name)), vim.log.levels.ERROR)
        return nil
    end

    -- 使用新 API 获取映射表
    local ok, mappings = pcall(function()
        return require("mason-lspconfig.mappings").get()
    end)

    if not ok or not mappings then
        vim.notify("Failed to load mason_to_lspconfig mappings!", vim.log.levels.ERROR)
        return mason_name
    end

    -- 处理带版本号的包名（如 rust-analyzer@nightly）
    local lsp_name = mappings[mason_name] or mappings[mason_name:gsub("@.+$", "")]
    return lsp_name or mason_name
end

-- 获取已安装的 LSP 服务器（过滤掉手动配置的常用 LSP）
function M._get_installed_lsp_servers()
    local registry = require("mason-registry")
    local specs = registry.get_all_package_specs()
    local installed_names = registry.get_installed_package_names()

    -- 过滤出 LSP 类型的包
    local lsp_servers = {}
    for _, spec in ipairs(specs) do
        if spec.categories and vim.tbl_contains(spec.categories, "LSP") and vim.tbl_contains(installed_names, spec.name) then
            table.insert(lsp_servers, M._mason_to_lsp_name(spec.name))
        end
    end

    -- 排除已手动配置的常用 LSP
    local manual_servers = { "lua_ls", "pyright" }  -- <<<<<< 修改此处：添加你的常用 LSP 名称
    return vim.tbl_filter(function(server)
        return not vim.tbl_contains(manual_servers, server)
    end, lsp_servers)
end

-- 获取已启用的 LSP 服务器（自动启用 + 手动配置）
function M._get_enabled_lsp_servers()
    return vim.tbl_keys(vim.lsp._enabled_configs)
end

-- 获取未启用的 LSP 服务器（仅自动安装但未配置的）
function M.get_cold_lsp_servers()
    local installed = M._get_installed_lsp_servers()
    local enabled = M._get_enabled_lsp_servers()

    local enabled_map = {}
    for _, name in ipairs(enabled) do
        enabled_map[name] = true
    end

    local cold_servers = {}
    for _, server in ipairs(installed) do
        if not enabled_map[server] then
            table.insert(cold_servers, server)
        end
    end
    return cold_servers
end

-- 辅助函数：获取 Mason 安装的 LSP 可执行文件路径
function M.get_mason_bin_path(server_name)
    local mason_lspconfig = require("mason-lspconfig")
    local mappings = mason_lspconfig.get_mappings()
    local lsp_name = mappings.mason_to_lspconfig[server_name] or server_name

    -- 获取包信息
    local pkg = mason_lspconfig.get_package(lsp_name)
    if not pkg then
        vim.notify(string.format("LSP %s not found in Mason!", server_name), vim.log.levels.ERROR)
        return nil
    end

    -- 构建 cmd 路径
    local cmd = pkg:get_bin()
    if not cmd then
        vim.notify(string.format("Failed to get cmd for LSP %s", server_name), vim.log.levels.ERROR)
        return nil
    end

    return cmd
end

-- Debugging 函数
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