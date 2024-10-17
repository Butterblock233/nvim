return {
	-- using lazy.nvim
	{
		"akinsho/bufferline.nvim",
		-- name = "BuffefLine",
		dependencies = "nvim-tree/nvim-web-devicons",
		event = "VeryLazy",
		keys = {
			{ "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
			{ "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
			{ "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete other buffers" },
			{ "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete buffers to the right" },
			{ "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete buffers to the left" },
			{ "<C-S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
			{ "<C-Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
			{ "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
			{ "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
		},
		config = {},
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		init = function()
			vim.g.lualine_laststatus = vim.o.laststatus
			if vim.fn.argc(-1) > 0 then
				-- set an empty statusline till lualine loads
				vim.o.statusline = " "
			else
				-- hide the statusline on the starter page
				vim.o.laststatus = 0
			end
		end,
		config = function()
			require("lualine").setup({
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
				lualine_y = { "progress" },
				lualine_z = { "location" },
			})
		end,
		--[[ lualine_a = { "mode" },
    lualine_b = { "branch" }, ]]
	},
	{
		"equalsraf/neovim-gui-shim",
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = {
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
			numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
			linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
			word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
			watch_gitdir = {
				follow_files = true,
			},
			auto_attach = true,
			attach_to_untracked = false,
			current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 1000,
				ignore_whitespace = false,
				virt_text_priority = 100,
			},
			current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
			sign_priority = 6,
			update_debounce = 100,
			status_formatter = nil, -- Use default
			max_file_length = 40000, -- Disable if file is longer than this (in lines)
			preview_config = {
				-- Options passed to nvim_open_win
				border = "single",
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
			-- yadm                         = {
			-- 	enable = false
			-- },
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = "VeryLazy",
		--@module "ibl"
		--@type ibl.config
		opts = {},
	},
	{
		"goolord/alpha-nvim",
		dependencies = {
			"echasnovski/mini.icons",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("alpha").setup(require("alpha.themes.theta").config)
		end,
	},
	{
		"nvchad/menu",
		dependencies = {
			"nvchad/base46",
			"nvchad/ui",
			"nvchad/volt",
		},
		lazy = true,
		-- config = function()
		-- 	-- Keyboard users
		-- 	vim.keymap.set("n", "<C-t>", function()
		-- 		require("menu").open("default")
		-- 	end, {})
		--
		-- 	-- mouse users + nvimtree users!
		-- 	vim.keymap.set("n", "<RightMouse>", function()
		-- 		vim.cmd.exec '"normal! \\<RightMouse>"'
		--
		-- 		local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
		-- 		require("menu").open(options, { mouse = true })
		-- 	end, {})
		-- end,
		-- keys = {
		-- 	{ "n", "<C-t>", function() require("menu").open("default") end },
		-- 	{ "n", "<RightMouse>", function()
		-- 		vim.cmd.exec '"normal! \\<RightMouse>"'
		--
		-- 		local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
		-- 		require("menu").open(options, { mouse = true })
		-- 	end },
		-- }
	},
}
