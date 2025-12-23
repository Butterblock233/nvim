return {
	{
		"Exafunction/windsurf.nvim",
		---@return boolean
		cond = function()
			-- vim.print(vim.env.CODEIUM)
			local enabled = vim.env.CODEIUM == "true"
			if vim.env.DEBUG == "true" then
				vim.print("Codeium cond: " .. tostring(enabled))
			end
			return enabled
		end,
		-- priority = 42,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
		},
		config = function(opts)
			require("codeium").setup(opts)
		end,
		event = "InsertEnter",
		opts = {},
	},
	{
		"Butterblock233/CLIAgents.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim", -- Required for git operations
		},
		keys = {
			{ "<leader>cc", "<cmd>CLIAgents<CR>", mode = { "t", "n" }, desc = "Toggle CLI Agents" },
			{ "<C-S-C>", "<cmd>CLIAgents<CR>", mode = { "t", "n" }, desc = "Toggle CLI Agents" },
			{ "<A-c>", "<cmd>CLIAgents<CR>", mode = { "t", "n" }, desc = "Toggle CLI Agents" },
		},
		cmd = {
			"CLIAgents",
			"CLIAgentsResume",
		},
		opts = {
			-- 新的多提供商配置
			providers = {
				default_provider = "claude", -- Default value
				providers = {
					gemini = {
						command = "gemini",
						default_variants = {
							-- model = "--model=gemini-pro",
						},
					},
					codex = {
						command = "codex",
						default_variants = {
							model = "-m deepseek/deepseek-chat-v3.1",
						},
					},
				},
			},
			shell = {
				separator = ";",
			},
			window = {
				split_ratio = 0.3, -- Percentage of screen for the terminal window (height for horizontal, width for vertical splits)
				---@type "botright" | "topleft" | "vertical" | "float"
				position = "float", -- Position of the window: "botright", "topleft", "vertical", "float", etc.
			},
			keymaps = {
				toggle = {
					-- normal = "<C-l>", -- Normal mode keymap for toggling Claude Code, false to disable
					-- terminal = "<C-l>", -- Terminal mode keymap for toggling Claude Code, false to disable
					variants = {
						continue = "<leader>cC", -- Normal mode keymap for Claude Code with continue flag
						verbose = "<leader>cV", -- Normal mode keymap for Claude Code with verbose flag
					},
				},
				window_navigation = true, -- Enable window navigation keymaps (<C-h/j/k/l>)
				scrolling = true, -- Enable scrolling keymaps (<C-f/b>) for page up/down
			},
		},
	},
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		cond = false,
		version = false, -- 永远不要将此值设置为 "*"！永远不要！
		opts = {
			-- 在此处添加任何选项
			-- 例如
			vendors = {
				openai = {
					endpoint = "https://api.openai.com/v1",
					model = "deepseek-coder", -- 您想要的模型（或使用 gpt-4o 等）
					timeout = 30000, -- 超时时间（毫秒），增加此值以适应推理模型
					temperature = 0,
					max_tokens = 8192, -- 增加此值以包括推理模型的推理令牌
					api_key_name = vim.env.OPENAI_API_KEY,
					--reasoning_effort = "medium", -- low|medium|high，仅用于推理模型
				},
				deepseek = {
					__inherited_from = "openai",
					api_key_name = vim.env.DEEPSEEK_API_KEY,
					endpoint = "https://api.deepseek.com",
					model = "deepseek-coder",
				},
			},
		},
		-- 如果您想从源代码构建，请执行 `make BUILD_FROM_SOURCE=true`
		-- build = "make",
		-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- 对于 Windows
		build = function()
			if os.getenv("OS") == "Windows_NT" then
				return "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource true" -- 对于 Windows
			else
				return "make"
			end
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- 以下依赖项是可选的，
			-- "echasnovski/mini.pick", -- 用于文件选择器提供者 mini.pick
			"nvim-telescope/telescope.nvim", -- 用于文件选择器提供者 telescope
			"hrsh7th/nvim-cmp", -- avante 命令和提及的自动完成
			-- "ibhagwan/fzf-lua", -- 用于文件选择器提供者 fzf
			"nvim-tree/nvim-web-devicons", -- 或 echasnovski/mini.icons
			-- "zbirenbaum/copilot.lua", -- 用于 providers='copilot'
			{
				-- 支持图像粘贴
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- 推荐设置
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- Windows 用户必需
						use_absolute_path = true,
					},
				},
			},
			{
				-- 如果您有 lazy=true，请确保正确设置
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},
	{
		"supermaven-inc/supermaven-nvim",
		cond = true,
		event = { "InsertEnter" },
		cmd = {
			"SupermavenStart",
			"SupermavenStop",
			"SupermavenRestart",
			"SupermavenToggle",
			"SupermavenUseFreeVersion",
			"SupermavenUsePro",
			"SupermavenLogout",
			"SupermavenShowLog",
			"SupermavenClearLog",
		},
		opts = {
			disable_keymaps = true, -- defined in cmp
			disable_inline_completion = false,
		},
		config = function(opts)
			if vim.env.SUPERMAVEN == "true" then
				require("supermaven-nvim").setup(opts)
			else
				-- internal implementation of require("supermaven-nvim.api").stop(), which does not show any messages
				vim.g.SUPERMAVEN_DISABLED = 1
				require("supermaven-nvim.document_listener").teardown()
				require("supermaven-nvim.binary.binary_handler"):stop_binary()
			end
		end,
	},
}
