require("project").setup()
local lspsaga = require("config.lsp.utils.lspsaga")
local lspconfig = require("config.lsp.utils.lspconfig")
local mason = require("config.lsp.utils.mason")
local conf = require("config.lsp.utils.lsp_signature")

return {
	--LSP三件套
	{
		"mason-org/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallALl", "MasonUpdate", "MasonLog" },
		-- tag = "v1.11.0",
		build = ":MasonUpdate",
		opts = {
			-- 自动启用安装的服务器
			automatic_installation = true,
			-- 自动启用的服务器配置
			automatic_enable = {
				-- 排除手动管理的常用服务器
				exclude = { "lua_ls", "basedpyright", "powershell_es", "clangd" },
			},
		},
		lazy = true,
		cond = true,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		-- tag = "v1.11.0",
		opts = {},
		lazy = true,
		cond = true,
	},
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPost", -- Load lspconfig, mason, mason-lspconfig
		dependencies = {
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "VidocqH/lsp-lens.nvim", priprity = 25 },
			{ "nvimdev/lspsaga.nvim" },
		},
		config = function()
			lspconfig.setup()
			mason.setup()
		end,
		keys = lspconfig.keys,
	},
	{
		"ray-x/lsp_signature.nvim",
		cond = true,
		event = "InsertEnter",
		opts = conf.opts,
		keys = conf.keys,
		config = function()
			require("lsp_signature").setup(conf.opts)
			-- require("lsp_signature").on_attach(conf.on_attach
		end,
	},
	{
		"VidocqH/lsp-lens.nvim",
		lazy = true,
		priprity = 50,
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
	},
}
