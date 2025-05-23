local health = vim.health

local M = {}

function M.check()
	health.start("Checking Environment Variables")

	-- 需要检查的环境变量列表
	local env_vars = {
		"NVIM_GUI_FONT",
		"NVIM_GUI_FONT_WIDE",
		"TEST",
		"CODEIUM",
		"SHELL",
		"PROF",
		"DEEPSEEK_API_KEY",
		"OBSIDIAN",
		"OBSIDIAN_PATH",
		"DEBUG"
	}

	for _, var in ipairs(env_vars) do
		local value = vim.env[var]
		if value == nil then
			health.warn(("$%s 未设置"):format(var))
		else
			health.ok(("$%s 已设置（当前值: %s）"):format(var, value))
		end
	end
end

return M
