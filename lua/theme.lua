local colorscheme = "lunar"
-- tokyonight
-- OceanicNext
-- gruvbox
-- zephyr
-- nord
-- onedark
-- nightfox
-- default
-- catppuccin
-- vscode
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("找不到主题" .. colorscheme)
	return
end
vim.opt.guifontwide = '微软雅黑' -- 中文字体
