return {
	{
		"olimorris/persisted.nvim",
		lazy = true,
		cond = true,
		-- event = "VeryLazy",
		cmd = {"SessionLoad","SessionSave","SessionSelect","SessionDelete","SessionLoadLast"},
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("persisted").setup({
				save_dir = vim.fn.stdpath("data") .. "persisted/sessions/", -- 默认会话存储路径
				autoload = false, -- 启动时自动加载最近会话
				autosave = true, -- 自动保存会话
			})
			-- Telescope 集成
			require("telescope").load_extension("persisted")
		end,
		keys = {
			{ "<leader>qs", "<cmd>SessionLoad<CR>", desc = "Load the session for current directory" },
			-- { "<leader>qS", "<cmd>Telescope persisted<CR>",   desc = "Select a session to  load" } ,
			{ "<leader>qS", "<cmd>SessionSelect<CR>", desc = "Select a session to  load" },
			{ "<leader>ql", "<cmd>SessionLoadLast<CR>", desc = "Load last session" },
			{ "<leader>qw", "<cmd>SessionSave<CR>", desc = "Save current session" },

			{ "<leader>qd", "<cmd>SessionDelete<CR>", desc = "Delete current session" },
			{
				mode = "n",
				"<leader>fs",
				"<cmd>Telescope persisted<CR>",
				desc = "Telescope find sessions",
			},
		},
	},
	-- Lua
	{
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		cond = false,
		opts = {
			-- add any custom options here
			{
				dir = vim.fn.stdpath("state") .. "persistence/sessions/", -- directory where session files are saved
				-- minimum number of file buffers that need to be open to save
				-- Set to 0 to always save
				need = 1,
				branch = true, -- use git branch to save session
			},
		},
		keys = {
			{
				"<leader>qs",
				function()
					require("persistence").load()
				end,
				desc = "Load session for the current directory",
			},
			{
				"<leader>qS",
				function()
					require("persistence").select()
				end,
				desc = "Select a session to load",
			},
			{
				"<leader>ql",
				function()
					require("persistence").load({ last = true })
				end,
				desc = "Load the last session",
			},
			{
				"<leader>qd",
				function()
					require("persistence").stop()
				end,
				desc = "Stop persistence (don't save on exit)",
			},
			-- { "<leader>qd", function() require("persistence").select end,                desc = "Stop persistence (don't save on exit)" },
		},
	},
}
