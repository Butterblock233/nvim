local cmp = require("cmp")
local M = {}

function M.setup()
	vim.o.wildmode = ''
	vim.o.wildmenu = false

	vim.keymap.set('c', '<C-n>', cmp.mapping.select_next_item())
	vim.keymap.set('c', '<C-p>', cmp.mapping.select_prev_item())
	vim.keymap.set('c','<C-Tab>','')
	cmp.setup.cmdline(':', {
		mapping = {
			['<tab>'] = cmp.mapping.confirm({
				select = false,
				behavior = cmp.ConfirmBehavior.Replace
			}),
			['<C-CR>'] = cmp.mapping.complete_common_string(),
			-- ['<C-<Tab>'] = '',
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
