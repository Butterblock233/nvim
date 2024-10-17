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
		"nvimdev/dashboard-nvim",
		lazy = true,
	},
	{
		"ahmedkhalf/project.nvim",
		-- config=true,
		event = "VeryLazy",
		config = function()
			require("project_nvim").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},
}
