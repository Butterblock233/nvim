return {
	{
		"stevearc/conform.nvim",
		event = "VeryLazy",
		config = {
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				python = { "isort", "black" },
				-- You can customize some of the format options for the filetype (:help conform.format)
				rust = { "rustfmt", lsp_format = "fallback" },
				-- Conform will run the first available formatter
				javascript = { "prettierd", "prettier", stop_after_first = true },
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 150,
				lsp_format = "fallback",
			},
		},
		keys = {
			{ "<leader>fc", function()require("conform").format()end,  desc = "Format Code"  },
		},
	},
}
