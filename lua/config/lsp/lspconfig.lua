local M = {}

-- local lspconfig = require("lspconfig")
-- local lspconfig = {}
M.opts = {}
-- 启用虚拟文本
vim.diagnostic.config({
	virtual_text = true, -- 显示错误消息
	signs = true, -- 显示行号旁的标记
	underline = true, -- 显示下划线
})

function M.setup()
	-- local lspconfig = require("lspconfig")
	-- 自动配置已安装的 LSP 服务器
	-- lspconfig.detekt.setup{}
	-- lspconfig.gdtoolkit.setup{}
end

M.keys = {
	{ "gD", vim.lsp.buf.declaration, desc = "Go to declaration" },
	{ "gd", vim.lsp.buf.definition, desc = "Go to definition" },
	{ "K", vim.lsp.buf.hover, desc = "Show infomation" },
	{ "gI", vim.lsp.buf.implementation, desc = "Go to implementation" },
	{ "<C-k>", vim.lsp.buf.signature_help, desc = "Show help" },
	{ "<space>D", vim.lsp.buf.type_definition },
	{ "<space>rn", vim.lsp.buf.rename, desc = "Rename" },
	-- { mode = 'nv', '<space>ca', vim.lsp.buf.code_action, desc = "重命名" },
	{ mode = "n", "gR", vim.lsp.buf.references },
	-- { "<leader>fc", vim.lsp.buf.format,        desc = "Format Code" },
}
return M
