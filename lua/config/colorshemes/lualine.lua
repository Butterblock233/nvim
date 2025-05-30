local M = {}
local colors = {
	violet = "#B388FF",
}

local mode_color_map = {
	t = colors.violet,
}
local function set_mode_colour()
	local current_mode = vim.fn.mode()
	local color = mode_color_map[current_mode]
	if color then
		return { bg = color }
	end
end
M.opts = {
	options = {
		-- theme = "gruvbox"
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = {
			{ "mode", color = set_mode_colour, separator = { right = "" } },
		},
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
		lualine_c = { "filename" },
		lualine_x = { "encoding", "filetype" },
		lualine_y = { "lsp_status" },
		lualine_z = { "progress", "location" },
	},
}

return M
