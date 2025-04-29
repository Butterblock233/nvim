return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = "VeryLazy",
	lazy = true,
	opts = {
		ensure_installed = { "c", "python", "lua", "vim", "vimdoc", "javascript", "html" },
		sync_install = false,
		highlight = { enable = true },
		indent = { enable = true },
	},
}
