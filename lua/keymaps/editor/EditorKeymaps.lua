local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}
local map=vim.keymap.set
-- Hint: see `:h vim.map.set()`
-- Better window navigation
map('n', '<M-h>', '<C-w>h', opts)
map('n', '<M-j>', '<C-w>j', opts)
map('n', '<M-k>', '<C-w>k', opts)
map('n', '<M-l>', '<C-w>l', opts)



--  快速保存 --
map('i','<C-s>','<cmd>w<CR>',opts)
map('n','<C-s>',':w<CR>')


--窗口移动--
map('i','<C-h>','<Left>',opts)
map('i','<C-j>','<Down>',opts)
map('i','<C-k>','<Up>',opts)
map('i','<C-l>','<Right>',opts)

--<C-w>关闭窗口--
map('i','<C-w>','<cmd>q')
map('n','<C-w>','<cmd>q')

-- Hint: start visual mode with the same area as the previous area and the same mode
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)
