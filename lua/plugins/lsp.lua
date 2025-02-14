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
		{
			"ray-x/lsp_signature.nvim",
			event = "InsertEnter",
			-- event = "VeryLazy",
			opts = {},
			keys = {
				{
					mode = "i",
					"<C-i>",
					function()
						require("lsp_signature").toggle_float_win()
					end,
					{ silent = true, noremap = true, desc = "toggle signature" },
				},
				{
					mode = "n",
					"<leader>if",
					function()
						require("lsp_signature").toggle_float_win()
					end,
					{ silent = true, noremap = true, desc = "toggle signature" },
				},
			},
			config = function()
				vim.api.nvim_create_autocmd("LspAttach", {
					callback = function(args)
						local bufnr = args.buf
						local client = vim.lsp.get_client_by_id(args.data.client_id)
						if vim.tbl_contains({ "null-ls" }, client.name) then -- blacklist lsp
							return
						end
						require("lsp_signature").on_attach({
							-- ... setup options here ...
							bind = true,
							floating_window = false, -- 启用浮动窗口
							hint_enable = true, -- 启用内联提示
							hint_prefix = "", -- 设置内联提示的前缀
						}, bufnr)
					end,
				})
				vim.notify("Lsp signature enabled")
			end,
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
