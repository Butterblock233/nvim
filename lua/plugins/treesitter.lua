return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	tags = "0.8.5.2",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		ensure_installed = { "c", "python", "lua", "vim", "vimdoc", "javascript", "html" },
		sync_install = false,
		highlight = { enable = true, event = { "BufReadPre", "BufNewFile" } },
		indent = { enable = true },
	},
	config = function(opts)
		require("nvim-treesitter.configs").setup(opts)
		-- Ensure treesitter highlight for python enabled
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "python",
			callback = function()
				-- 启用 Tree-sitter 高亮（如果支持）
				if vim.fn.exists(":TSBufEnable") == 2 then
					vim.cmd("TSBufEnable highlight")
				end

				-- 可选：启用缩进（如果你也用了 nvim-treesitter 的 indent 功能）
				-- if vim.fn.exists(":TSBufEnable") == 2 then
				-- 	vim.cmd("TSBufEnable indent")
				-- end
			end,
		})
	end,
}
