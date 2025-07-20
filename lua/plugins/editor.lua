return {
	-- If you want neo-tree's file operations to work with LSP (updating imports, etc.), you can use a plugin like
	-- https://github.com/antosha417/nvim-lsp-file-operations:
	{
		"antosha417/nvim-lsp-file-operations",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-neo-tree/neo-tree.nvim",
		},
		opts = {},
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		cond = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		--cmd = "Neotree",
		keys = {
			{
				"<leader>e",
				function()
					require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
				end,
				desc = "Explorer NeoTree (cwd)",
			},
		},
		opts = {
			filesystem = {
				hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
			},
			default_component_configs = {
				git_status = {
					symbols = {
						-- Change type
						added = "✚",
						deleted = "D  ",
						modified = "M",
						renamed = "󰑕",
						-- Status type
						untracked = "U",
						ignored = "",
						unstaged = "",
						staged = "",
						conflict = "",
					},
				},
			},
		},
	},
	{
		"nvim-tree/nvim-tree.lua",
		cond = false, --disabled
		version = "*",
		lazy = true,
		event = "VeryLazy",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{
				"<leader>e",
				"<cmd>NvimTreeToggle<CR>",
				{ desc = "Toggle Nvim-Tree" },
			},
		},
		opts = {
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 33,
			},
			renderer = {
				group_empty = true,
				icons = {
					padding = "  ",
				},
			},
			filters = {
				dotfiles = true,
			},
		},
	},
	{
		"OXY2DEV/markview.nvim",
		lazy = true, -- Not Recommended
		ft = "markdown", -- If you decide to lazy-load anyway
		-- event = "VeryLazy",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"xzbdmw/colorful-menu.nvim",
		lazy = true,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		lazy = true,
		event = "BufReadPost",
		opts = function(_, opts)
			-- Other blankline configuration here
			return require("indent-rainbowline").make_opts(opts)
		end,
		dependencies = {
			"TheGLander/indent-rainbowline.nvim",
		},
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
	},
}
