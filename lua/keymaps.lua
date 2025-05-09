local opts = {
	noremap = true, -- non-recursive
	silent = true, -- do not show message
}
-- map = vim.keymap.set
-- Hint: see `:h vim.map.set()`
-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

--  快速保存 --
vim.keymap.set("i", "<C-s>", "<cmd>w<CR>", opts)
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>")
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")

-- 移动到行首/行尾 --
vim.keymap.set("n", "H", "<Home>")
vim.keymap.set("n", "L", "<End>")
--光标移动--
vim.keymap.set("i", "<C-h>", "<Left>", opts)
vim.keymap.set("i", "<C-j>", "<Down>", opts)
vim.keymap.set("i", "<C-k>", "<Up>", opts)
vim.keymap.set("i", "<C-l>", "<Right>", opts)

--<C-backspace>删除词
vim.keymap.set("i", "<C-BS>", "<C-w>")
vim.keymap.set("n", "<C-BS>", "<C-w>")
--[[ --<C-w>关闭窗口--
vim.keymap.set('i','<C-w>','<cmd>q<CR>')
vim.keymap.set('n','<C-w>','<cmd>q<CR>') ]]

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

vim.keymap.set("n", "f2", "<cmd>source ~/AppData/Local/nvim/init.lua<CR>", { desc = "重新加载配置" })

--插入模式下粘贴文本
vim.keymap.set("i", "<C-v>", "<cmd>set paste<CR><C-R>*<cmd>set nopaste<CR>")

vim.keymap.set("n", "<leader>st", "<cmd>Lazy profile<CR>")

vim.keymap.set("n", "<leader>ih", function()
	if not vim.lsp.inlay_hint.is_enabled() then
		vim.lsp.inlay_hint.enable(true)
		vim.print("Inlay hint enabled")
	else
		vim.lsp.inlay_hint.enable(false)
		vim.print("Inlay hint disabled")
	end
end, { desc = "Toggle inlay_hint" })
-- vim.keymap.set('n', '<leader>f','')
--
-- -- Terminal
-- function _G.set_terminal_keymaps()
-- 	local options = { buffer = 0 }
-- 	vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], options)
-- 	vim.keymap.set('t', 'jk', [[<C-\><C-n>]], options)
-- 	vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], options)
-- 	vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], options)
-- 	vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], options)
-- 	vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], options)
-- 	vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], options)
-- end
--
--
-- Command mode
-- vim.keymap.set('c',"<CR>",'') --你小子害人不浅
-- vim.keymap.set('c','','')
