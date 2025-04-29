require("project").setup()
local lspsaga = require("config.lsp.utils.lspsaga")
local lspconfig = require("config.lsp.utils.lspconfig")
local mason = require("config.lsp.utils.mason")
return {
	{
		"VidocqH/lsp-lens.nvim",
		lazy = true,
		-- event = "BufReadPost",
		opts = {
			enable = true,
			include_declaration = false, -- Reference include declaration
			sections = { -- Enable / Disable specific request, formatter example looks 'Format Requests'
				definition = false,
				references = true,
				implements = true,
				git_authors = true,
			},
			ignore_filetype = {
				"prisma",
			},
		},
		{
			"nvimdev/lspsaga.nvim",
			-- event = "BufReadPost",
			lazy = true,
			dependencies = {
				"nvim-treesitter/nvim-treesitter", -- optional
				"nvim-tree/nvim-web-devicons", -- optional
			},
			keys = lspsaga.keys,
			opts = lspsaga.opts,
		},

		--LSP三件套
		{
			"williamboman/mason.nvim",
			config = true,
			lazy = true,
			cond = true,
		},
		{
			"williamboman/mason-lspconfig.nvim",
			config = {
				ensure_installed = {
					"lua_ls",
					"pyright",
					"powershell_es",
					"clangd",
				}, -- 指定需要自动安装的 LSP 服务器
			},
			lazy = true,
			cond = true,
		},
		{
			"neovim/nvim-lspconfig",
			event = "BufReadPost", -- Load lspconfig, mason, mason-lspconfig
			dependencies = {
				{ "williamboman/mason.nvim" },
				{ "williamboman/mason-lspconfig.nvim" },
				{ "VidocqH/lsp-lens.nvim" },
				{ "nvimdev/lspsaga.nvim" },
			},
			config = function()
				lspconfig.setup()
				mason.setup()
			end,
			keys = lspconfig.keys,
		},
	},
}
