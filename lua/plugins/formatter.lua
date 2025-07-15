return {
	"stevearc/conform.nvim",
	event = "VeryLazy",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform will run multiple formatters sequentially
			python = { "ruff", "black", "isort" },
			-- You can customize some of the format options for the filetype (:help conform.format)
			rust = { "rustfmt", lsp_format = "fallback" },
			-- Conform will run the first available formatter
			javascript = { "prettierd", "prettier", stop_after_first = true },
			cpp = { "clang-format" },
		},
		formatters = {
			ruff = {
				command = "ruff",
				args = { "format", "--stdin-filename", "$FILENAME" },
			},
		},
	},
	keys = {
		{
			"<leader>fc",
			function()
				require("conform").format()
			end,
			desc = "Format Code",
		},
	},
}
