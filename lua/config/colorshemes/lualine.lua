local M = {}


M.opts = {
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			"branch",
			"diff",
			{
				"diagnostics",
				-- Table of diagnostic sources, available sources are:
				--   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
				-- or a function that returns a table as such:
				--   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
				sources = { "nvim_diagnostic", "coc" },

				-- Displays diagnostics for the defined severity types
				sections = { "error", "warn", "info", "hint" },

				diagnostics_color = {
					-- Same values as the general color option can be used here.
					error = "DiagnosticError", -- Changes diagnostics' error color.
					warn = "DiagnosticWarn", -- Changes diagnostics' warn color.
					info = "DiagnosticInfo", -- Changes diagnostics' info color.
					hint = "DiagnosticHint", -- Changes diagnostics' hint color.
				},
				--symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'},
				colored = true, -- Displays diagnostics status in color if set to true.
				update_in_insert = true, -- Update diagnostics in insert mode.
				always_visible = false, -- Show diagnostics even if there are none.
			},
		},
	},
	lualine_c = { "filename" },
	lualine_x = { "encoding", "fileformat", "filetype" },
	lualine_y = { "progress",

		{
			function()
				if not vim.g.loaded_xmake then return "" end
				local Info = require("xmake.info")
				if Info.mode.current == "" then return "" end
				if Info.target.current == "" then return "Xmake: Not Select Target" end
				return ("%s(%s)"):format(Info.target.current, Info.mode.current)
			end,
			cond = function()
				return vim.o.columns > 100
			end,
		}
	},
	lualine_z = { "location" },
}

return M
