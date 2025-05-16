require("utils.dotenv").load(".env")
vim.o.guifont = vim.env.NVIM_GUI_FONT
vim.o.guifontwide = vim.env.NVIM_GUI_FONT_WIDE
vim.o.shell = vim.env.SHELL
