local M = {}

function M.setup()
	local dap = require("dap")
	dap.configurations.java = {}
	dap.configurations.python = {
		{
			name = "Debug Current File",
			type = "debugpy", -- references an entry in dap.adapters
			request = "launch",
			-- + Other debug adapter specific configuration options
		},
		{
			-- The first three options are required by nvim-dap
			type = 'python', -- the type here established the link to the adapter definition: `dap.adapters.python`
			request = 'launch',
			name = "Launch file",

			-- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

			program = "${file}", -- This configuration will launch the current file if used.
			pythonPath = function()
				-- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
				-- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
				-- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
				local cwd = vim.fn.getcwd()
				if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
					return cwd .. '/venv/bin/python'
				elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
					return cwd .. '/.venv/bin/python'
				else
					return '/usr/bin/python'
				end
			end,
		},
	} -- 配置 C++ 调试会话
	dap.configurations.cpp = {
		{
			name = 'Launch C++ Program',
			type = 'cppdbg',
			request = 'launch',
			program = function()
				return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/a.out', 'file')
			end,
			cwd = '${workspaceFolder}', -- 调试时的工作目录
			stopAtEntry = false, -- 不在入口处停止
			args = {},         -- 启动时传递的命令行参数
			setupCommands = {
				{
					description = 'Enable pretty-printing for gdb',
					text = '-enable-pretty-printing',
					ignoreFailures = true
				}
			},
			miDebuggerPath = 'gdb', -- 也可以设置为 gdb
		}
	}
	-- 	type = "cpp",
	-- 	request = "launch",
	-- }
end

return M
