-- 获取当前光标下的语法高亮组名称
local function get_syntax_highlight_group()
	local line = vim.fn.line(".") -- line
	local col = vim.fn.col(".") -- column
	local syn_id = vim.fn.synID(line, col, 1)
	local syn_name = vim.fn.synIDattr(syn_id, "name")
	if syn_name then
		return syn_name
	else
		return "Unknown"
	end
end

vim.keymap.set("n", "<leader>hh", function()
	local syn_name = get_syntax_highlight_group()
	vim.notify("Syntax highlight group: " .. syn_name)
end, { noremap = true, silent = true, desc = "Print Syntax Highlight Group" })

local highlights = {
	-- Normal = { fg = "#D4D4D4", bg = "#1E1E1E" },
	-- Comment = { fg = "#6A9955", italic = true },
	Statement = { link = "Keyword" },

	-- 语法高亮组
	Keyword = { fg = "#569CD6", italic = true },
	Type = { fg = "#4EC9B0" },
	Function = { fg = "#DCDCAA" },
	-- String = { fg = "#CE9178" },
	Identifier = { fg = "#9cdcfe" },
	Number = { fg = "#b5cea8" },
	-- Operator = { fg = "#FABD2F" },

	-- Treesitter 高亮组
	["@keyword"] = { link = "Keyword" },
	["@type"] = { link = "Type" },
	["@function"] = { link = "Function" },
	["@string"] = { link = "String" },
	["@variable"] = { link = "Identifier" },
	["@number"] = { link = "Number" },
	["@comment"] = { link = "Comment" },
	["@operator"] = { link = "Operator" },

	-- Python
	pythonFunction = { link = "Function" },
	pythonBuiltin = { link = "Function" },
	pythonSelf = { link = "Identifier" },
	pythonImport = { link = "Keyword" },
	pythonExClass = { link = "Type" },
	pythonStatement = { link = "Keyword" },
	pythonInclude = { link = "Keyword" },

	-- Semshi: Python highlight plugin
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

	-- Typescript
}

local function reload_highlight()
	-- 应用高亮配置
	for group, properties in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, properties)
	end
end

vim.keymap.set("n", "<C-F4>", function()
	reload_highlight()
end, { desc = "Reload Hightlight Group" })

reload_highlight()
