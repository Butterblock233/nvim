local env_path = vim.fn.stdpath('config') .. '/.env'
vim.notify(env_path)
vim.cmd('Dotenv ~/.config/nvim/.env')

vim.o.guifont = vim.env.NVIM_GUI_FONT
vim.o.guifontwide = vim.env.NVIM_GUI_FONT_WIDE
