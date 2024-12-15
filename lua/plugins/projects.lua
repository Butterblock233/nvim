return {
	{
		'goolord/alpha-nvim',
		lazy = true,
	},

	{
		'echasnovski/mini.starter',
		lazy = true,
	},
	{
		'Mythos-404/xmake.nvim',
		version = '^3',
		lazy = true,
		event = 'BufReadPost',
		config = true,
		opts = {
			{
				-- Configuration when saving `xmake.lua`
				on_save = {
					-- Reload project information
					reload_project_info = true,
					-- Configuration for generating `compile_commands.json`
					lsp_compile_commands = {
						enable = true,
						-- Directory name (relative path) for output file
						output_dir = 'build',
					},
				},

				-- Debugger related configuration
				debuger = {
					-- Checks the project's build mode, and if it’s not among the modes below,
					-- it will automatically switch to `debug` mode for build/run,
					-- and then switch back to the original build mode
					rulus = { 'debug', 'releasedbg' },
					-- Dap configuration, please refer to Dap and the debugger's documentation
					dap = {
						name = 'Xmake Debug',
						type = 'codelldb',
						request = 'launch',
						cwd = '${workspaceFolder}',
						console = 'integratedTerminal',
						stopOnEntry = false,
						runInTerminal = true,
					},
				},

				-- Notification related settings
				notify = {
					-- Icons for completion
					icons = {
						error = '',
						successfully = '',
					},
					-- Icons for progress display
					spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
					-- Refresh rate for the progress bar
					refresh_rate_ms = 100,
				},

				-- Runner configuration
				runner = {
					-- Select which backend to use
					type = 'toggleterm', ---@type 'toggleterm'|'terminal'|'quickfix'

					config = {
						toggleterm = {
							direction = 'float', ---@type 'vertical'|'horizontal'|'tab'|'float'
							singleton = true,
							auto_scroll = true,
							close_on_success = false,
						},
						terminal = {
							name = 'Runner Terminal',
							prefix_name = '[Xmake]: ',
							split_size = 15,
							split_direction = 'horizontal', ---@type 'vertical'|'horizontal'
							focus = true,
							focus_auto_insert = true,
							auto_resize = true,
							close_on_success = false,
						},
						quickfix = {
							show = 'always', ---@type 'always'|'only_on_error'
							size = 15,
							position = 'botright', ---@type 'vertical'|'horizontal'|'leftabove'|'aboveleft'|'rightbelow'|'belowright'|'topleft'|'botright'
							close_on_success = false,
						},
					},
				},
				-- Executor configuration
				execute = {
					-- Select which backend to use
					type = 'quickfix', ---@type 'toggleterm'|'terminal'|'quickfix'

					config = {
						toggleterm = {
							direction = 'float', ---@type 'vertical'|'horizontal'|'tab'|'float'
							singleton = true,
							auto_scroll = true,
							close_on_success = true,
						},
						terminal = {
							name = 'Executor Terminal',
							prefix_name = '[Xmake]: ',
							split_size = 15,
							split_direction = 'horizontal', ---@type 'vertical'|'horizontal'
							focus = false,
							focus_auto_insert = true,
							auto_resize = true,
							close_on_success = true,
						},
						quickfix = {
							show = 'only_on_error', ---@type 'always'|'only_on_error'
							size = 15,
							position = 'botright', ---@type 'vertical'|'horizontal'|'leftabove'|'aboveleft'|'rightbelow'|'belowright'|'topleft'|'botright'
							close_on_success = true,
						},
					},
				},

				-- Enable development mode
				dev_debug = true,
			}
		}
	},
	{
		'Civitasv/cmake-tools.nvim',
		event = "VeryLazy",
		dependencies = {
			'nvim-lua/plenary.nvim'
		}
	},
	{
		'alexander-born/bazel.nvim',
		dependencies = {
			'nvim-treesitter/nvim-treesitter', 'nvim-lua/plenary.nvim' },
		cond = false,
	},

	{
		'nvimdev/dashboard-nvim',
		lazy = true,
	},
	{
		'ahmedkhalf/project.nvim',
		-- config=true,
		cond = false,
		event = 'VeryLazy',
		config = function()
			require('project_nvim').setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},
}
