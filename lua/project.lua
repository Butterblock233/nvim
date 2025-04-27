local M = {
	default_flags = {
		-- Version Control
		".git",
		".hg",
		-- Build Systems
		"Makefile",
		"CMakeLists.txt",
		"xmake.lua",
		"build.zig",
		-- Language Specific
		"package.json",
		"pyproject.toml",
		"Cargo.toml",
		-- Environment
		".venv",
		"venv",
		"requirements.txt",
	},
}

--- @class ProjectSetupOpts
--- @field flags? string[] Additional project flags (supports file/dir patterns)
--- @field use_defaults? boolean Include default flags (default: true)
--- @field validators? table<string, fun(path:string):boolean> Custom validation per project type

function M.setup(opts)
	opts = vim.tbl_deep_extend("force", {
		use_defaults = true,
		flags = {},
		validators = {},
	}, opts or {})

	-- Merge flags
	local project_flags = opts.use_defaults and vim.list_extend(vim.deepcopy(M.default_flags), opts.flags) or opts.flags

	-- Register all project types
	local group = vim.api.nvim_create_augroup("ProjectEnterEvents", { clear = true })

	vim.api.nvim_create_autocmd({ "VimEnter", "DirChanged", "BufEnter" }, {
		group = group,
		pattern = "*",
		callback = function()
			vim.schedule(function()
				for _, flag in ipairs(project_flags) do
					local path = vim.fn.getcwd() .. "/" .. flag
					if vim.fn.filereadable(path) == 1 or vim.fn.isdirectory(path) == 1 then -- Fixed: Added closing parenthesis here
						-- Run custom validator if exists
						local validator = opts.validators[flag]
						if not validator or validator(path) then
							vim.api.nvim_exec_autocmds("User", {
								pattern = "ProjectEnter:" .. flag,
								modeline = false,
							})
						end
					end
				end
			end)
		end,
	})

	-- Declare all events for documentation
	for _, flag in ipairs(project_flags) do
		vim.api.nvim_create_autocmd("User", {
			group = group,
			pattern = "ProjectEnter:" .. flag,
			callback = function() end,
			desc = "Project type: " .. flag,
		})
	end
end

--- Quick validator generators
M.validators = {
	--- Check if file contains pattern
	--- @param pattern string
	file_contains = function(pattern)
		return function(path)
			local file = io.open(path, "r")
			if not file then
				return false
			end
			local content = file:read("*a")
			file:close()
			return content:find(pattern) ~= nil
		end
	end,
}

return M

