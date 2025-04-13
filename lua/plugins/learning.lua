return {
	{
		"AndrewRadev/exercism.vim",
		event = "VeryLazy",
	},

	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	-- event = {
	--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
	--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
	--   -- refer to `:h file-pattern` for more examples
	--   "BufReadPre path/to/my-vault/*.md",
	--   "BufNewFile path/to/my-vault/*.md",
	-- },
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",

		-- see below for full list of optional dependencies 👇
	},
	opts = {
		workspaces = {
			{
				name = "Obsidian",
				path = "D:/Butter_Block/Obsidian",
			},
			-- {
			--   name = "work",
			--   path = "~/vaults/work",
			-- },
		},

		-- see below for full list of options 👇
	},
	{
		"hisbaan/dataview.nvim",
		-- only load dataview.nvim for files in your obsidian vault	
		event = "VeryLazy",
		-- configuration here, see below for full configuration options
		opts = {
			vault_dir = "D:/Butter_Block/Obsidian",
			buffer_type = "float", -- float | split | vsplit | tab
		},
	},
	{
		"kawre/leetcode.nvim",
		event = "VeryLazy",
		build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
		dependencies = {
			"nvim-telescope/telescope.nvim",
			-- "ibhagwan/fzf-lua",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
		opts = {
			-- configuration goes here

			lang = "python",

			cn = { -- leetcode.cn
				enabled = true, ---@type boolean
				translator = true, ---@type boolean
				translate_problems = true, ---@type boolean
			},
		},
	},
}
