return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	tags = "0.8.5.2",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		ensure_installed = { "c", "python", "lua", "vim", "vimdoc", "javascript", "html", "nu" },
		sync_install = false,
		highlight = { enable = true },
		indent = { enable = true },
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
