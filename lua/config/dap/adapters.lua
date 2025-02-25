local M = {}
function M.setup()
	local dap = require("dap")
	dap.adapters.gdb = {
		type = "executable",
		command = "gdb",
		args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
	}
	dap.adapters.lldb = {
		type = "execute",
		command = "lldb-dap",
	} -- 配置 Python 调试适配器
	dap.adapters.python = {
		type = "executable",
		command = "python",
		args = { "-m", "debugpy.adapter" },
	}
	-- 配置 C++ 调试适配器
	dap.adapters.cppdbg = {
		type = "executable",
		command = "gdb", -- Linux 系统通常使用 lldb，Windows 使用 gdb
		args = { "--interpreter=mi2" },
	} -- dap.configurations.cpp = {
end

return M
