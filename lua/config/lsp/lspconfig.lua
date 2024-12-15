local M = {}

-- local lspconfig = require("lspconfig")
-- local lspconfig = {}
M.opts = {

}
function M.setup()
	local lspconfig = require("lspconfig")
	-- 自动配置已安装的 LSP 服务器
	-- lspconfig.detekt.setup{}
	-- lspconfig.gdtoolkit.setup{}
	lspconfig.v_analyzer.setup {}
	lspconfig.clangd.setup {
		inlay_hint = true,
	}
	lspconfig.lua_ls.setup {
		inlay_hint = true,
		on_init = function(client)
			local path = client.workspace_folders[1].name
			if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
				return
			end

			client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
				runtime = {
					-- Tell the language server which version of Lua you're using
					-- (most likely LuaJIT in the case of Neovim)
					version = 'LuaJIT'
				},
				-- Make the server aware of Neovim runtime files
				workspace = {
					checkThirdParty = false,
					library = {
						vim.env.VIMRUNTIME,
						-- Depending on the usage, you might want to add additional paths here.
						-- "${3rd}/luv/library"
						-- "${3rd}/busted/library",
					}
					-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
					-- library = vim.api.nvim_get_runtime_file("", true)
				}
			})
		end,
		settings = {
			Lua = {}
		} }
end

M.keys = {
	{ 'gD',        vim.lsp.buf.declaration,     desc = "Go to declaration" },
	{ 'gd',        vim.lsp.buf.definition,      desc = "Go to definition" },
	{ 'K',         vim.lsp.buf.hover,           desc = "Show infomation" },
	{ 'gI',        vim.lsp.buf.implementation,  desc = "Go to implementation" },
	{ '<C-k>',     vim.lsp.buf.signature_help,  desc = "Show help" },
	{ '<space>D',  vim.lsp.buf.type_definition, },
	{ '<space>rn', vim.lsp.buf.rename,          desc = "Rename" },
	-- { mode = 'nv', '<space>ca', vim.lsp.buf.code_action, desc = "重命名" },
	{ mode = 'n',  'gR',                        vim.lsp.buf.references, }
}
return M
