return {
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		event="VeryLazy",
		config={
		    close_on_exit = true,
		},
		keys = {
			{ "<leader>tt", "<Cmd>ToggleTerm<CR>", desc = "Toggle Terminal" },
			{'t', '<esc>', [[<C-\><C-n>]], {buffer=0}}

		},
	}
}
