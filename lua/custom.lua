local dotenv_path = vim.fn.stdpath('config') .. '/.env'
vim.notify(dotenv_path)
vim.cmd('Dotenv ' .. dotenv_path)

vim.o.guifont = vim.env.NVIM_GUI_FONT
vim.o.guifontwide = vim.env.NVIM_GUI_FONT_WIDE
