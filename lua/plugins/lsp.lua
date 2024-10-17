-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {desc="转到定义"})
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
		-- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
		-- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
		-- vim.keymap.set('n', '<space>wl', function()
		-- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		-- end, opts)
		vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
		vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
		vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		-- vim.keymap.set('n', '<space>f', function()
		-- 	vim.lsp.buf.format { async = true }
		-- end, opts)
	end,
})
local M = {
	{
		"williamboman/mason.nvim",
		config = true,
		lazy = true,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = {
			ensure_installed = { "lua_ls", "pyright" } -- 指定需要自动安装的 LSP 服务器
		},
		lazy = true
	},
	{
		"neovim/nvim-lspconfig",
		event ="VeryLazy",
		-- event=function ()
		-- 	vim.api.nvim_create_autocmd("BufEnter",{
		-- 		pattern="!alpha"
		-- 	})
		-- end,
		config = function()
			-- 设置 mason
			local lspconfig = require("lspconfig")
			-- 自动配置已安装的 LSP 服务器
			-- lspconfig.detekt.setup{}
			-- lspconfig.gdtoolkit.setup{}

			require("mason-lspconfig").setup_handlers({
				-- 默认处理器（可选）
				function(server_name) -- 自动安装的 LSP 服务器会这样设置；server_name represents mason-lspconfig.nvim known server name
					lspconfig[server_name].setup {}
				end,

				-- 覆盖默认处理器（示例）
				["lua_ls"] = function()
					lspconfig.lua_ls.setup {
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
						}
					}
				end,
			})
		end
	}
}
return M
