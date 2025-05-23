return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		event = "VeryLazy",
		module = "Terminal",
		cond = false,
		opts = {
			close_on_exit = true,
			open_mapping = [[<c-\>]],
			shell = vim.env.SHELL,
			direction = "float",
			execs = {
				{ nil, "<M-1>", "Horizontal Terminal", "horizontal", 0.3 },
				{ nil, "<M-2>", "Vertical Terminal", "vertical", 0.4 },
				{ nil, "<M-3>", "Float Terminal", "float", nil },
			},
		},
		keys = {
			{ mode = "n", "<leader>tt", "<Cmd>ToggleTerm<CR>", desc = "Toggle Terminal" },
			{ mode = { "t", "n" }, "<M-1>", [[<C-\>]], { buffer = 0 } },
		},
		winbar = {
			enabled = false,
		},
	},
}
