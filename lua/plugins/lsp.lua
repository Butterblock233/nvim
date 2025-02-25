return {
	{
		"VidocqH/lsp-lens.nvim",
		lazy = true,
		opts = {
			enable = true,
			include_declaration = false,
		},
		{
			"nvimdev/lspsaga.nvim",
			event = "BufEnter",
			lazy = true,
			dependencies = {
				"nvim-treesitter/nvim-treesitter", -- optional
				"nvim-tree/nvim-web-devicons", -- optional
			},
			keys = require("config.lsp.lspsaga").keys,
			opts = require("config.lsp.lspsaga").opts,
		},

		--LSP三件套
		{
			"williamboman/mason.nvim",
			config = true,
			lazy = true,
		},
		{
			"williamboman/mason-lspconfig.nvim",
			config = {
				ensure_installed = { "lua_ls", "pyright" }, -- 指定需要自动安装的 LSP 服务器
			},
			lazy = true,
		},
		{
			"neovim/nvim-lspconfig",
			event = "VeryLazy",
			dependencies = {
				{ "williamboman/mason.nvim" },
				{ "williamboman/mason-lspconfig.nvim" },
			},
			config = function()
				require("config.lsp.lspconfig").setup()
				require("config.lsp.mason").setup()
			end,
			keys = require("config.lsp.lspconfig").keys,
		},
	},
}
