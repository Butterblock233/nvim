--- toggle indentation between Tabs and Spaces
local function toggle_indent()
	if vim.opt.expandtab:get() then
		vim.opt.expandtab = false
		vim.opt.tabstop = 4
		vim.opt.shiftwidth = 4
		vim.notify("Set indent to Tabs", vim.log.levels.INFO)
	else
		vim.opt.expandtab = true
		vim.opt.tabstop = 4
		vim.opt.shiftwidth = 4
		vim.notify("Set indent to Spaces", vim.log.levels.INFO)
	end
end

--- format file indentation to match current settings (Tabs or Spaces)
local function format_indent()
	if vim.opt.expandtab:get() then
		vim.cmd("%retab!")
		vim.notify("Formatted indentation to Spaces", vim.log.levels.INFO)
	else
		vim.cmd("%retab!")
		vim.notify("Formatted indentation to Tabs", vim.log.levels.INFO)
	end
end

vim.api.nvim_create_user_command("ToggleIndent", toggle_indent, {
	desc = "Toggle between Tab and Space indentation",
})

vim.api.nvim_create_user_command("FormatIndent", format_indent, {
	desc = "Format indentation to match current settings (Tabs or Spaces)",
})
