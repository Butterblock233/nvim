local lspsaga = require("config.lsp.lspsaga")
local lspconfig = require("config.lsp.lspconfig")
local mason = require("config.lsp.mason")
local conf = require("config.lsp.lsp_signature")

return {
	--LSP三件套
	{
		"mason-org/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallALl", "MasonUpdate", "MasonLog" },
		cond = function()
			-- env: IS_NIXOS ==> Do Not Load
			return not (vim.env.IS_NIXOS == "true")
		end,
		-- tag = "v1.11.0",
		-- build = ":MasonUpdate",
		build = function()
			require("mason").setup()
			vim.cmd(":MasonUpdate")
		end,
		opts = {
			-- 自动启用安装的服务器
			-- automatic_installation = true,
			-- 自动启用的服务器配置
			-- ensure_installed = { "lua_ls", "basedpyright", "powershell_es", "ruff", "clangd" ,"ast_grep"},
			-- automatic_enable = {
			-- 	-- 排除手动管理的常用服务器
			-- 	exclude = { "lua_ls", "basedpyright", "powershell_es", "clangd", "ruff" },
			-- },
		},
		lazy = true,
	},

	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "mason-org/mason.nvim" },
		-- event = {"VeryLazy"},
		build = function()
			require("mason").setup()
			vim.cmd("MasonUpdate")
			vim.cmd({ cmd = "MasonInstall", args = mason.ensure_installed_server })
		end,
		cond = function()
			-- env: IS_NIXOS ==> Do Not Load
			return not (vim.env.IS_NIXOS == "true")
		end,
		cmd = { "LspInstall", "LspUninstall" },
		opts = {
			automatic_enable = {
				exclude = {
					"lua_ls",
					"basedpyright",
					"powershell_es",
					"ruff",
					"clangd",
					"sourcekit",
					"nu"
				},
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		-- Do not set event "BufReadPost", it will break filetype detection at the first time when neovim starts
		-- event = "VeryLazy", -- Load lspconfig, mason, mason-lspconfig
		event = { "BufReadPre", "BufNewFile", "VeryLazy" },
		dependencies = {
			-- { "williamboman/mason.nvim" },
			-- { "williamboman/mason-lspconfig.nvim" },
			{ "VidocqH/lsp-lens.nvim", priprity = 25 },
			{ "nvimdev/lspsaga.nvim" },
		},
		config = function()
			mason.setup()
			lspconfig.setup()
		end,
		keys = lspconfig.keys,
	},
	{
		"ray-x/lsp_signature.nvim",
		cond = false,
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
		cond = false,
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
