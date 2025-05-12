-- Hint: use `:h <option>` to figure out the meaning if needed
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.mouse = "a" -- allow the mouse to be used in Nvim
vim.g.mapleader = " "

-- Tab options
vim.opt.tabstop = 4 -- number of visual spaces per TAB
vim.opt.softtabstop = 4 -- number of spacesin tab when editing
vim.opt.shiftwidth = 4 -- insert 4 spaces on a tab
vim.opt.expandtab = false -- tabs are spaces, mainly because of python
-- Tab options for python
vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.shiftwidth = 4
		vim.opt_local.expandtab = false
	end,
})

-- UI config
vim.opt.number = true -- show absolute number
--vim.opt.relativenumber = true 相对行号
vim.opt.cursorline = true -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true -- open new vertical split bottom
vim.opt.splitright = true -- open new horizontal splits right
-- vim.opt.termguicolors = true        -- enabl 24-bit RGB color in the TUI
vim.opt.showmode = false -- we are experienced, wo don't need the "-- INSERT --" mode hint

-- Searching
vim.opt.incsearch = true -- search as characters are entered
vim.opt.hlsearch = false -- do not highlight matches
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true -- but make it case sensitive if an uppercase is entered
-- map = vim.keymap.set
-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 关闭Swap文件
--vim.opt.noswapfile = true
vim.opt.swapfile = true

--autoreload
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
	command = "if mode() != 'c' | checktime | endif",
	pattern = { "*" },
})
vim.diagnostic.config({ update_in_insert = true }) -- 插入模式下启用代码诊断
--鼠标事件
vim.opt.mouse = "a"

-- session options
vim.o.sessionoptions = "buffers,curdir,folds,globals,tabpages,winpos,winsize"

-- vim.cmd([[cnoremap wqa wa | qa]])
--
--
-- vim.o.guifont = "Monospace:h14"
--
--

--自动换行设置
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.bo.formatoptions = vim.bo.formatoptions .. "ro"
	end,
})

-- Neovim clipboard config
vim.opt.clipboard = "unnamedplus" -- use system clipboard
if vim.fn.has("wsl") then
	vim.g.clipboard = {
		name = "win32yank",
		copy = {
			["+"] = "win32yank.exe -i --crlf",
			["*"] = "win32yank.exe -i --crlf",
		},
		paste = {
			["+"] = "win32yank.exe -o --lf",
			["*"] = "win32yank.exe -o --lf",
		},
	}
end
