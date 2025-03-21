-- 获取当前光标下的语法高亮组名称
local function get_syntax_highlight_group()
	local line = vim.fn.line(".") -- 获取当前行号
	local col = vim.fn.col(".") -- 获取当前列号
	local syn_id = vim.fn.synID(line, col, 1) -- 获取语法 ID
	local syn_name = vim.fn.synIDattr(syn_id, "name") -- 获取语法高亮组名称
	if syn_name then
		return syn_name
	else
		return "Unknown"
	end
end

-- 绑定快捷键 <leader>hh 来打印当前光标下的语法高亮组名称
vim.keymap.set("n", "<leader>hh", function()
	local syn_name = get_syntax_highlight_group()
	-- 使用 vim.notify 输出（Neovim 0.5+）
	vim.notify("Syntax highlight group: " .. syn_name)
end, { noremap = true, silent = true })

-- 定义高亮组
local highlights = {
	-- 基础高亮组
	-- Normal = { fg = "#D4D4D4", bg = "#1E1E1E" }, -- 正常文本
	-- Comment = { fg = "#6A9955", italic = true }, -- 注释

	-- 语法高亮组
	Keyword = { fg = "#569CD6", italic = true }, -- 关键字
	Type = { fg = "#4EC9B0" }, -- 类型
	Function = { fg = "#DCDCAA" }, -- 函数
	-- String = { fg = "#CE9178" }, -- 字符串
	Identifier = { fg = "#9cdcfe" }, -- 变量
	Number = { fg = "#b5cea8" }, -- 数字
	-- Operator = { fg = "#FABD2F" }, -- 运算符

	-- Treesitter 高亮组
	["@keyword"] = { link = "Keyword" }, -- 关键字
	["@type"] = { link = "Type" }, -- 类型
	["@function"] = { link = "Function" }, -- 函数
	["@string"] = { link = "String" }, -- 字符串
	["@variable"] = { link = "Identifier" }, -- 变量
	["@number"] = { link = "Number" }, -- 数字
	["@comment"] = { link = "Comment" }, -- 注释
	["@operator"] = { link = "Operator" }, -- 运算符

	-- Python
	pythonFunction = { link = "Function" },
	pythonBuiltin = { link = "Function" },
	pythonSelf = { link = "Identifier" },
	pythonImport = { link = "Keyword" },
	pythonExClass = { link = "Type" },
	pythonStatement = { link = "Keyword" },
	pythonInclude = { link = "Keyword" },

	-- Semshi 专用高亮组
	semshiLocal = { link = "Identifier" },
	semshiBuiltin = { link = "Type" },
	semshiGlobal = { link = "Identifier" },
	semshiImported = { link = "Identifier" },
	semshiParameter = { link = "Identifier" },
	semshiParameterUnused = { fg = "#D4D4D4", bg = "#6A9955", undercurl = true },
	semshiFree = { link = "Identifier" },
	semshiAttribute = { link = "Identifier" },
	semshiSelf = { link = "Identifier" },
	semshiErrorSign = { fg = "#FF0000", bg = "#1E1E1E" },
	semshiErrorChar = { fg = "#FF0000", bg = "#1E1E1E" },

	-- C++
	cType = { link = "keyword" },

	-- Haskell
	VarID = { link = "Identifier" },

	-- lua
	luaTable = { fg = "#4ec9b0" },
}

local function reload_highlight(highlights)
	-- 应用高亮配置
	for group, properties in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, properties)
	end
end

vim.keymap.set("n", "<C-F4>", function()
	reload_highlight(highlights)
end, { desc = "Reload Hightlight Group" })

if vim.filetype ~= "lua" then
	reload_highlight(highlights)
	vim.notify("Hightlight group loaded")
end
