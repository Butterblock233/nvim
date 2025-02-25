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
		config = true,
		-- use opts = {} for passing setup options
		-- this is equivalent to setup({}) function
	},
	{
		"vidocqh/auto-indent.nvim",
		opts = {},
		cond = false,
		event = "VeryLazy",
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
		dependencies = {
			"theHamsta/nvim_rocks",
			build = "pip3 install --user hererocks && python3 -mhererocks . -j2.1.0-beta3 -r3.0.0 && cp nvim_rocks.lua lua",
			config = function()
				require("nvim_rocks").ensure_installed("luautf8")
			end,
		},
	},
	{
		--arrow.nvim
		--Desc:a Neovim's bookmark plugin
		"otavioschwanck/arrow.nvim",
		opts = {
			show_icons = true,
			leader_key = ";", -- Recommended to be a single key
			buffer_leader_key = "m", -- Per Buffer Mappings
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
		ft = "lua", -- 只在 Lua 文件加载
		dependencies = {
			{ "justinsgithub/wezterm-types", lazy = true }, -- Wezterm 类型定义
			{ "Bilal2453/luvit-meta", lazy = true }, -- Luvit 类型支持（可选）
		},
		opts = {
			library = {
				-- 确保路径正确指向依赖的安装位置
				{ path = "wezterm-types/types", words = { "wezterm" } }, -- 仅在 'wezterm' 出现时加载
				{ path = "luvit-meta/library", words = { "luv" } }, -- 仅在 'luv' 出现时加载
				-- 可选的其他库路径
				vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
				-- 如果需要 Neovim 或 Lazy.nvim 的类型支持，可以取消注释
				-- vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
				-- vim.fn.expand("$VIMRUNTIME/lua/vim"),
			},
		},
	},
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		event = "VeryLazy",
		cond = true,
		---@type snacks.Config
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			dim = { enabled = true },
			toggle = {
				enabled = true,
				map = vim.keymap.set, -- keymap.set function to use
				which_key = true, -- integrate with which-key to show enabled/disabled icons and colors
				notify = true, -- show a notification when toggling
				-- icons for enabled/disabled states
			},
		},
		-- { "folke/neodev.nvim", enabled = false }, -- make sure to uninstall or disable neodev.nvim
		{
			"kdheepak/lazygit.nvim",
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
	},
}
