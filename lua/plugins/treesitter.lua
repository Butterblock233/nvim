return {
	"nvim-treesitter/nvim-treesitter",
	-- build = function()
	-- 	require("nvim-treesitter.install").update({ with_sync = true })()
	-- end,
	tags = "0.8.5.2",
	build = ":TSUpdate",
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
