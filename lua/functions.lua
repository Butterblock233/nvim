--- functions.lua
--- defines some functiosn
vim.api.nvim_create_augroup("AutoReload", { clear = true })

-- 当配置文件被修改时，重新加载
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = vim.fn.stdpath("config"), -- 替换为你的配置文件路径
	group = "AutoReload",
	callback = function()
		vim.cmd("source %")
		vim.cmd('echo "Reloading Configurations"')
	end,
})
