return {
	{
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
			--- @class ParserConfig
			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

			parser_config.dae = {
				install_info = {
					url = "~/src/projects/tree-sitter-dae", -- local path or git repo
					files = { "src/parser.c" },
				},
				filetype = "dae",
			}
		end,
	},

	{
		"daliusd/incr.nvim",
		event = "VeryLazy",
		opts = {
			incr_key = "<CR>", -- increment selection key
			decr_key = "<S-CR>", -- decrement selection key
		},
		config = function(_, opts)
			vim.keymap.set("n", "<S-CR>", "") -- disable default <S-CR> mapping
			-- require("incr").setup(opts)
			vim.keymap.set(
				{ "n", "x" },
				"<CR>",
				require("utils").ts_selection.increment_selection,
				{ desc = "Increment selection" }
			)
			vim.keymap.set(
				"x",
				"<S-CR>",
				require("utils").ts_selection.decrement_selection,
				{ desc = "Decrement selection" }
			)
		end,
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
