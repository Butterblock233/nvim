local M = {}

-- 用于缓存当前目录，避免重复调用 getcwd()
local current_dir = nil
local last_check_time = 0
local debounce_ms = 100

-- 获取当前目录（缓存）
local function get_current_dir()
	local now = vim.uv.now()
	if current_dir and now - last_check_time < debounce_ms then
		return current_dir
	end
	current_dir = vim.fn.getcwd()
	last_check_time = now
	return current_dir
end

-- 检查路径是否存在（文件或目录）
local function path_exists(path)
	return vim.uv.fs_stat(path) ~= nil
end

-- 事件回调：仅当当前目录下存在 [pattern] 时才继续执行
function M.project_enter_callback(event)
	local pattern = event.match
	if not pattern then
		return false
	end

	local dir = get_current_dir()
	local path = dir .. "/" .. pattern

	if not path_exists(path) then
		return false -- 路径不存在，跳过事件
	end

	return true -- 路径存在，继续执行事件链
end

-- 注册 User ProjectEnter 事件
function M.setup()
	local group = vim.api.nvim_create_augroup("ProjectEnterOnDemand", { clear = true })

	-- 注册 User ProjectEnter 事件模板
	vim.api.nvim_create_autocmd("User", {
		group = group,
		pattern = "ProjectEnter:*",
		callback = M.project_enter_callback,
		desc = "Conditionally trigger ProjectEnter events only when [pattern] exists in current directory",
	})
end

return M
