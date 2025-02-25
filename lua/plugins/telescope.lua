-- local builtin = require('telescope.builtin')
-- local keymaps = {
-- }

-- plugins/telescope.lua:
return {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	tag = "0.1.8",
	-- or                              , branch = '0.1.x',
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "Telescope find files",
		},
		{
			"<leader>ft",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "Telescope find texts",
		},
		{
			"<leader>fb",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "Telescope buffers",
		},
		{
			"<leader>fh",
			function()
				require("telescope.builtin").help_tags()
			end,
			desc = "Telescope help tags",
		},
	},
}
