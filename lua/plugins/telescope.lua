local builtin = require('telescope.builtin')
local keymaps = {
}
-- plugins/telescope.lua:
return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	-- or                              , branch = '0.1.x',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
		vim.keymap.set('n', '<leader>ft', builtin.live_grep, { desc = 'Telescope find texts' })
		vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
	end,
	keys = {
		{ mode = 'n', "<leader>fs", "<cmd>Telescope persisted<CR>",{desc = 'Telescope find sessions'}}
	}
}
