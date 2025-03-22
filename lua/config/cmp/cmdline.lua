local cmp = require("cmp")
local M = {}

function M.setup()
	-- 禁用 Neovim 原生补全
	vim.o.wildmode = ""
	vim.o.wildmenu = false

	-- 定义补全映射
	local mapping = {
		-- Tab 键：确认选中项（若补全菜单可见），否则插入普通 Tab
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.confirm({ select = true }) -- 强制使用当前选中项
			else
				fallback() -- 普通 Tab 行为
			end
		end, { "i", "c" }),

		-- C-n/C-p：上下移动补全项
		["<C-n>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				cmp.complete() -- 若补全菜单不可见，则触发补全
			end
		end),

		["<C-p>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				cmp.complete() -- 若补全菜单不可见，则触发补全
			end
		end),

		-- Enter 键：补全公共前缀（类似 VS Code）
		["<CR>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = false,
				})
				cmp.mapping.complete_common_string() -- 补全公共前缀
			else
				fallback() -- 普通 Enter 行为
			end
		end),
	}

	-- 配置 cmdline 补全
	cmp.setup.cmdline(":", {
		completion = {
			completeopt = "menu,menuone,noinsert",
		},
		mapping = mapping,
		sources = cmp.config.sources({
			{ name = "path" },
			{
				name = "cmdline",
				option = {
					ignore_cmds = { "Man", "!" },
				},
				-- 按字母排序补全项
				sorting_comparator = function(a, b)
					return a.insertText < b.insertText
				end,
			},
		}),
	})
end

return M
