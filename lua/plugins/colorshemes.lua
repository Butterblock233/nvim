return {
	-- tokyonight
	{
		"folke/tokyonight.nvim",
		lazy = true,
		opts = { style = "moon" },
	},
	-- onedark
	{
		"navarasu/onedark.nvim",
		lazy = true,
	},
	{
		"lunarvim/lunar.nvim",
		lazy = true,
	},
	{
		"olivercederborg/poimandres.nvim",
		lazy = true,
	},

	{
		"gbprod/nord.nvim",
		lazy = true,
		priority = 1000,
		install = {
			colorscheme = { "nord" },
		},
	},
	{
		"Mofiqul/vscode.nvim",
		lazy = true,
	},
}
