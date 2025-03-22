-- 切换缩进格式（Tab 或空格）
local function toggle_indent()
	if vim.opt.expandtab:get() then
		vim.opt.expandtab = false -- 切换到 Tab 缩进
		vim.opt.tabstop = 4 -- 设置 Tab 宽度为 4 个空格
		vim.opt.shiftwidth = 4 -- 设置自动缩进宽度为 4 个空格
		vim.notify("Set indent to Tabs", vim.log.levels.INFO)
	else
		vim.opt.expandtab = true -- 切换到空格缩进
		vim.opt.tabstop = 4 -- 设置 Tab 宽度为 4 个空格
		vim.opt.shiftwidth = 4 -- 设置自动缩进宽度为 4 个空格
		vim.notify("Set indent to Spaces", vim.log.levels.INFO)
	end
end

-- 根据当前缩进设置格式化文件
local function format_indent()
	if vim.opt.expandtab:get() then
		vim.cmd("%retab!") -- 转换 Tab 为空格
		vim.notify("Formatted indentation to Spaces", vim.log.levels.INFO)
	else
		vim.cmd("%retab!") -- 转换空格为 Tab
		vim.notify("Formatted indentation to Tabs", vim.log.levels.INFO)
	end
end

-- 绑定到编辑器命令
vim.api.nvim_create_user_command("ToggleIndent", toggle_indent, {
	desc = "Toggle between Tab and Space indentation",
})

vim.api.nvim_create_user_command("FormatIndent", format_indent, {
	desc = "Format indentation to match current settings (Tabs or Spaces)",
})
