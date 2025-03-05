local function load_devcontainer()
	local cwd = vim.fn.getcwd()
	local devcontainer_path = cwd .. "/.devcontainer"
	if vim.fn.isdirectory(devcontainer_path) == 1 then
		require("devcontainer").setup({})
		vim.notify("Dev Container is available")
	end
end
-- 设置自动命令（启动时 + 目录变化时检测）
vim.api.nvim_create_autocmd({ "VimEnter", "DirChanged" }, {
	pattern = "*",
	callback = load_devcontainer,
})

return {
	"https://codeberg.org/esensar/nvim-dev-container",
	dependencies = { "nvim-treesitter/nvim-treesitter" }, -- 依赖插件
	lazy = true, -- 标记为延迟加载
}
