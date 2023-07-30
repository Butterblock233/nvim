-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

-----------------
-- Normal mode --
-----------------

-- Hint: see `:h vim.map.set()`
-- Better window navigation
vim.keymap.set('n', '<M-h>', '<C-w>h', opts)
vim.keymap.set('n', '<M-j>', '<C-w>j', opts)
vim.keymap.set('n', '<M-k>', '<C-w>k', opts)
vim.keymap.set('n', '<M-l>', '<C-w>l', opts)

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)


--  快速保存 --
vim.keymap.set('i','<C-s>',':w<CR>')

vim.keymap.set('i','<C-h>','<Left>',opts)
vim.keymap.set('i','<C-j>','<Down>',opts)
vim.keymap.set('i','<C-k>','<Up>',opts)
vim.keymap.set('i','<C-l>','<Right>',opts)

--vim.keymap.set('i','<>','<>',opts)



-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)


-- 插件设置 -- 
vim.keymap.set('n','<C-b>',':Neotree<CR>',opts)
vim.keymap.set('i','<C-b>',':Neotree<CR>',opts)