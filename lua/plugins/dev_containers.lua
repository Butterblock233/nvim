require("project").setup({
	use_defaults = true,
	flags = {".devcontainer"}
})
return {
	"https://codeberg.org/esensar/nvim-dev-container",
	dependencies = { "nvim-treesitter/nvim-treesitter" }, -- 依赖插件
	lazy = true, -- 标记为延迟加载
	event = "User ProjectEnter:.devcontainer"
}
