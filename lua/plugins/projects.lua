require("project").setup({
	use_defaults = true,
	flags = { "pyproject.toml" }, -- Additional flags
})
return {
	{
		"goolord/alpha-nvim",
		lazy = true,
	},

	{
		"echasnovski/mini.starter",
		lazy = true,
	},
	{
		"Mythos-404/xmake.nvim",
		version = "^3",
		lazy = true,
		event = "User ProjectEnter:xmake.lua",
		ft = "lua",
		dependencies = {
			{
				"nvim-notify",
				lazy = true,
				event = "VeryLazy",
			},
		},
		opts = {

			-- Configuration when saving `xmake.lua`
			on_save = {
				-- Reload project information
				reload_project_info = true,
				-- Configuration for generating `compile_commands.json`
				lsp_compile_commands = {
					enable = true,
					-- Directory name (relative path) for output file
					output_dir = "build",
				},
			},
			lsp = {
				enable = true,
				language = "zh-cn", ---@type "en"|"zh-cn"
			},
		},
	},
	{
		"Civitasv/cmake-tools.nvim",
		event = "User ProjectEnter:CmakeLists.txt",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"alexander-born/bazel.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-lua/plenary.nvim",
		},
		cond = false,
	},

	{
		"nvimdev/dashboard-nvim",
		lazy = true,
	},
	{
		"ahmedkhalf/project.nvim",
		-- config=true,
		cond = false,
		event = "VeryLazy",
		config = function()
			require("project_nvim").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},
	{
		"linux-cultist/venv-selector.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"mfussenegger/nvim-dap",
			"mfussenegger/nvim-dap-python", --optional
			{ "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
		},
		lazy = true,
		event = "User ProjectEnter:.venv",
		ft = "python",
		branch = "regexp", -- This is the regexp branch, use this for the new version
		keys = {
			{ ",v", "<cmd>VenvSelect<cr>" },
		},
		opts = {
			-- Your settings go here
		},
	},
	{
		"benomahony/uv.nvim",
		event = "User ProjectEnter:pyproject.toml",
		-- opts = {},
	},
}
