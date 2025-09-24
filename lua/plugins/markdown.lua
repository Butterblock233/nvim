return {
	{
		-- 如果您有 lazy=true，请确保正确设置
		"MeanderingProgrammer/render-markdown.nvim",
		opts = (function()
			local colors = require("config.colors")
			return {
				file_types = { "markdown", "Avante" },
				heading = {
					backgrounds = colors.headings.backgrounds,
					foregrounds = colors.headings.foregrounds,
				},
			}
		end)(),
		ft = { "markdown", "Avante" },
	},
	{
		"OXY2DEV/markview.nvim",
		cond = false,
		lazy = true, -- Not Recommended
		ft = "markdown", -- If you decide to lazy-load anyway
		-- event = "VeryLazy",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
}
