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
				build = "make install_jsregexp",
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
