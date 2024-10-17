local opts = {
	noremap = true, -- non-recursive
	silent = true, -- do not show message
}
-- map = vim.keymap.set
-- Hint: see `:h vim.map.set()`
-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)


--  快速保存 --
vim.keymap.set('i', '<C-s>', '<cmd>w<CR>', opts)
vim.keymap.set('n', '<C-s>', '<cmd>w<CR>')
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>')


-- 移动到行首/行尾 --
vim.keymap.set('n', 'H', '<Home>')
vim.keymap.set('n', 'L', '<End>')
--光标移动--
vim.keymap.set('i', '<C-h>', '<Left>', opts)
vim.keymap.set('i', '<C-j>', '<Down>', opts)
vim.keymap.set('i', '<C-k>', '<Up>', opts)
vim.keymap.set('i', '<C-l>', '<Right>', opts)

--<C-backspace>删除词
vim.keymap.set('i', '<C-BS>', '<C-w>')
vim.keymap.set('n', '<C-BS>', '<C-w>')
--[[ --<C-w>关闭窗口--
vim.keymap.set('i','<C-w>','<cmd>q<CR>')
vim.keymap.set('n','<C-w>','<cmd>q<CR>') ]]

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

vim.keymap.set('n', 'f2', '<cmd>source ~/AppData/Local/nvim/init.lua<CR>',{desc="重新加载配置"})

vim.keymap.set('i', '<C-v>', '<C-r>+')
-- vim.keymap.set('n', '<leader>f','')
