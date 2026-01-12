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
	}
	dap.adapters.python = {
		type = "executable",
		command = "python",
		args = { "-m", "debugpy.adapter" },
	}
	dap.adapters.cppdbg = {
		type = "executable",
		command = "gdb",
		args = { "--interpreter=mi2" },
	}
end

return M
