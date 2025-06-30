--[[ local cmp = require('cmp')
local lspkind = require('lspkind')
local types = require('cmp.types') ]]
return {
	--cmp--
	{
		"hrsh7th/cmp-nvim-lsp",
		-- after = "neovim/nvim-lspconfig",
		event = {
			"InsertEnter",
			"CmdlineEnter",
		},
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/nvim-cmp",
			{
				"L3MON4D3/LuaSnip",
				version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
				build = function ()
					if vim.fn.executable("make") == 1 then
						vim.fn.system({"make","install_jsregexp"})
						else vim.notify("GNU Make not found. Cannot build LuaSnip jsregexp module.", vim.log.levels.WARN)
					end
				end
			},
			"saadparwaiz1/cmp_luasnip",
			"onsails/lspkind.nvim",
			-- "neovim/nvim-lspconfig",
		},
		config = function()
			require("config.cmp").setup()
		end,
	},
}
