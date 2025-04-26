return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		-- 不需要 lazy = true 和 event = "VeryLazy"，除非有特殊需求
		-- 使用 keys 字段来定义快捷键更符合 lazy.nvim 的最佳实践
		keys = {
			{
				"<leader>ps",
				function()
					require("snacks").profiler.scratch()
				end,
				desc = "Profiler Scratch Buffer",
			},
			-- 可以添加其他官方推荐的快捷键
			{
				"<leader>pp",
				function()
					require("snacks").toggle.profiler()
				end,
				desc = "Toggle Profiler",
			},
			{
				"<leader>ph",
				function()
					require("snacks").toggle.profiler_highlights()
				end,
				desc = "Toggle Profiler Highlights",
			},
			{
				"<leader>gg",
				function ()
					require("snacks").lazygit.open()
				end,
				desc = "Open Lazygit"
			},
		},
		opts = {
			-- 你的配置选项
			dim = { enabled = true },
			lazygit = {
				enabled = true,
			},
			profiler = {
				icons = {
					time = " ",
					pct = " ",
					count = " ",
					require = "󰋺 ",
					modname = "󰆼 ",
					plugin = " ",
					autocmd = "⚡",
					file = " ",
					fn = "󰊕 ",
					status = "󰈸 ",
				},
				globals = {
					"vim",
					"vim.api",
					"vim.keymap",
					-- "Snacks.dashboard.Dashboard",
				},
				enabled = true,
				-- notify = true,
				-- -- map = vim.keymap.set,
				-- which_key = true,
			},
			toggle = {
				enabled = true,
				map = vim.keymap.set,
				which_key = true,
				notify = true,
			},
		},
	},
}
-- 	{
-- 		"nvim-lualine/lualine.nvim",
-- 		cond = false,
-- 		priority = 2,
-- 		opts = function(_, opts)
-- 			table.insert(opts.sections.lualine_x, Snacks.profiler.status())
-- 		end,
-- 	}
-- }
