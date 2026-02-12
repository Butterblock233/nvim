--- @type vim.lsp.Config
return {
	-- Command and arguments to start the server.
	cmd = { "lua-language-server" },
	-- Filetypes to automatically attach to.
	filetypes = { "lua" },
	-- Sets the "root directory" to the parent directory of the file in the
	-- current buffer that contains either a ".luarc.json" or a
	-- ".luarc.jsonc" file. Files that share a root directory will reuse
	-- the connection to the same LSP server.
	root_markers = { ".luarc.json", ".luarc.jsonc" },

	settings = {
		Lua = {
			runtime = {
				-- path = { "?.lua", "?/init.lua" },
				-- pathStrict = true,
				version = "LuaJIT",
			},
			workspace = {
				checkThirdParty = false,
				-- ignoreDir = { "/lua" },
				library = {
					vim.env.VIMRUNTIME,
					-- "/usr/share/nvim/runtime/lua",
					-- "/home/butter/.local/share/nvim/lazy/lazy.nvim/lua",
					-- "LazyVim",
					-- "/home/butter/.config/nvim/lua",
					-- "/home/butter/.local/share/nvim/lazy/nvim-lspconfig/lua",
					-- "/home/butter/.local/share/nvim/lazy/mason.nvim/lua",
					-- "/home/butter/.local/share/nvim/lazy/mason-lspconfig.nvim/lua",
				},
			},
		},
		-- Specific settings to send to the server. The schema for this is
		-- defined by the server. For example the schema for lua-language-server
		-- can be found here https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
		-- settings = {
		-- 	Lua = {
		-- 		runtime = {
		-- 			version = "LuaJIT",
		-- 		},
		-- 	},
		-- },
		-- workspace = {
		-- 	checkThirdParty = false,
		-- 	library = {
		-- 		vim.env.VIMRUNTIME,
		-- 		-- Depending on the usage, you might want to add additional paths here.
		-- 		-- "${3rd}/luv/library"
		-- 		-- "${3rd}/busted/library",
		-- 	},
		-- 	-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
		-- 	-- library = vim.api.nvim_get_runtime_file("", true)
		-- },
		diagnostics = {
			globals = { "vim" },
		},
	},
}
