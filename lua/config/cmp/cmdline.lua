local cmp = require("cmp")
local M = {}

function M.setup()
	vim.o.wildmode = ''
	vim.o.wildmenu = false

	vim.keymap.set('c', '<C-n>', cmp.mapping.select_next_item())
	vim.keymap.set('c', '<C-p>', cmp.mapping.select_prev_item())
	cmp.setup.cmdline(':', {
		mapping = {
			['<tab>'] = cmp.mapping.confirm({
				select = true,
				behavior = cmp.ConfirmBehavior.Replace
			}),
		},
		sources = cmp.config.sources({
			{ name = 'path' }
		}, {
			{
				name = 'cmdline',
				option = {
					ignore_cmds = { 'Man', '!' }
				}
			}
		})
	})
end

return M
