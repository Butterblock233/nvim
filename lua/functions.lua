function createOpts(desc)
	local opts = {
		noremap = true,
		silent = true,
	}
	return table.insert(opts, desc)
end
vim.api.nvim_create_augroup('AutoReload', { clear = true })

-- 当配置文件被修改时，重新加载
vim.api.nvim_create_autocmd('BufWritePost', {
	pattern = vim.fn.stdpath('config'), -- 替换为你的配置文件路径
	group = 'AutoReload',
	callback = function()
		vim.cmd('source %')
		vim.cmd('echo Reloading Configurations')
	end
})
-- autocmds require forward slashes (even on windows)
local pattern = vim.fn.stdpath('config') .. "/*.lua"
vim.api.nvim_create_augroup("lvim_reload_config_on_save", {})
vim.api.nvim_create_autocmd("BufWritePost", {
	group = "lvim_reload_config_on_save",
	pattern = pattern,
	desc = "Trigger LvimReload on saving config.lua",
	callback = function()
		require("lvim.config"):reload()
	end,
})
