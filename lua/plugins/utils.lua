return {
	{
		-- vim-startuptime
		-- Desc:eveluate nvim's startup time
		"dstein64/vim-startuptime",
		-- lazy-load on a command
		cmd = "StartupTime",
		-- init is called during startup. Configuration for vim plugins typically should be set in an init function
		init = function()
			vim.g.startuptime_tries = 10
		end,
	},
	{
		-- which-key.nvim
		-- Desc: hint Keymaps
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	{
		-- nvim-autopairs
		-- Desc:automatically pair patterns like '"' '{' '['
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = true,
		-- Use opts = {} for passing setup options
		-- this is equivalent to setup({}) function
	},
	{
		"windwp/nvim-ts-autotag",
		opts = {},
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
	{
		"NMAC427/guess-indent.nvim",
		cond = false,
		event = "InsertEnter",
		opts = {},
	},
	{
		"vidocqh/auto-indent.nvim",
		cond = false,
		opts = {
			---@param lnum number
			---@return number
			indentexpr = function(lnum)
				return require("nvim-treesitter.indent").get_indent(lnum)
			end,
		},
		event = "InsertEnter",
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	{
		"chrisgrieser/nvim-spider",
		lazy = true,
		-- dependencies = {
		-- 	"theHamsta/nvim_rocks",
		-- 	build = "pip3 install --user hererocks && python3 -mhererocks . -j2.1.0-beta3 -r3.0.0 && cp nvim_rocks.lua lua",
		-- 	config = function()
		-- 		require("nvim_rocks").ensure_installed("luautf8")
		-- 	end,
		-- },
	},
	{
		--arrow.nvim
		--Desc:a Neovim's bookmark plugin
		"otavioschwanck/arrow.nvim",
		opts = {
			show_icons = true,
			leader_key = "<leader>;", -- Recommended to be a single key
			buffer_leader_key = "<leader>m", -- Per Buffer Mappings
		},
		event = "VeryLazy",
	},
	{
		-- nvim-fundo
		-- Desc:Makin nvim's undo more stable and useful
		"kevinhwang91/nvim-fundo",
		requires = "kevinhwang91/promise-async",
		run = function()
			require("fundo").install()
		end,
	},
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
	-- LazyDev.nvim
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- Library paths can be absolute
				-- "~/projects/my-awesome-lib",
				-- Or relative, which means they will be resolved from the plugin dir.
				"lazy.nvim",
				-- It can also be a table with trigger words / mods
				-- Only load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				-- always load the LazyVim library
				-- "LazyVim",
				-- Only load the lazyvim library when the `LazyVim` global is found
				{ path = "LazyVim", words = { "LazyVim" } },
				-- Load the wezterm types when the `wezterm` module is required
				-- Needs `DrKJeff16/wezterm-types` to be installed
				{ path = "wezterm-types", mods = { "wezterm" } },
				-- Load the xmake types when opening file named `xmake.lua`
				-- Needs `LelouchHe/xmake-luals-addon` to be installed
				{ path = "xmake-luals-addon/library", files = { "xmake.lua" } },
			},
			-- disable when a .luarc.json file is found
			-- enabled = function(root_dir)
			-- 	return not vim.uv.fs_stat(root_dir .. "/.luarc.json")
			-- end,

			intergrations = {
				-- lspconfig = false
			},
		},
	},
	-- { "folke/neodev.nvim", enabled = false }, -- make sure to uninstall or disable neodev.nvim
	{
		"kdheepak/lazygit.nvim",
		cond = false,
		lazy = true,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
	{ "Leonardo-Luz/dotenv.nvim", cond = false, url = "https://github.com/Leonardo-Luz/dotenv.nvim" },
	{
		"tpope/vim-dotenv",
		cond = false,
		event = "VimEnter",
		priority = 1000,
		config = function()
			local dotenv_path = vim.fn.stdpath("config") .. "/.env"
			vim.notify(dotenv_path)
			vim.cmd("Dotenv " .. dotenv_path)
			-- print(vim.env.CODEIUM == "true")
		end,
	},
	{
		--- This plugin is deprecated, we're now using build-in dotenv module. see lua/utils/dotenv.lua for details.
		"ellisonleao/dotenv.nvim",
		cond = false,
		-- init = function()
		-- 	require("dotenv").setup({
		-- 		enable_on_load = true, -- will load your .env file upon loading a buffer
		-- 		verbose = false, -- show error notification if .env file is not found and if .env is loaded
		-- 		file_name = ".env", -- will override the default file name '.env'
		-- 	})
		-- end,
		opts = {
			enable_on_load = true, -- will load your .env file upon loading a buffer
			verbose = true, -- show error notification if .env file is not found and if .env is loaded
			-- file_name = "~/.config/nvim/.env", -- will override the default file name '.env'
		},
	},
	{
		"vhyrro/luarocks.nvim",
		priority = 1000,
		cond = false,
		config = true,
		opts = {
			rocks = { "fzy", "pathlib.nvim ~> 1.0", "lua-dotenv" },
		},
	},
	{ "wakatime/vim-wakatime", cond = vim.env.WAKATIME == "true", event = "BufEnter" },
	{
		"folke/noice.nvim",
		cond = false,
		requires = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
		opts = {
			{
				lsp = {
					-- 覆盖markdown渲染，使cmp和其他插件使用Treesitter
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				presets = {
					lsp_doc_border = true, -- 为悬浮文档添加边框
				},
			},
		},
	},
}
