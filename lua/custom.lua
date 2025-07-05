require("utils.dotenv").load(".env")
-- vim.o.guifont = vim.env.NVIM_GUI_FONT
vim.o.guifontwide = vim.env.NVIM_GUI_FONT_WIDE
if vim.env.OS == "Windows_NT" or vim.env.PWSH == "true" then
	vim.o.shell = vim.fn.executable("pwsh") and "pwsh" or "powershell"
	vim.o.shellcmdflag ="-NoLogo -NonInteractive -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';$PSStyle.OutputRendering='plaintext';Remove-Alias -Force -ErrorAction SilentlyContinue tee;"
	vim.o.shellredir = "2>&1 | ForEach-Object { '$_' } | Out-File %s; exit $LastExitCode"
	vim.o.shellpipe = "2>&1 | ForEach-Object { '$_' } | Tee-Object %s; exit $LastExitCode"
	vim.o.shellquote = ""
	vim.o.shellxquote = ""
else
	vim.o.shell = vim.env.SHELL
end
