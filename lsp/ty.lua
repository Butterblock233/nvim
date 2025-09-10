return {
	-- Command and arguments to start the server.
	-- Filetypes to automatically attach to.
	name = "ty",
	cmd = { "ty", "server" },
	filetypes = { "python" },
	root_markers = { ".git", "pyproject.toml", "pixi.toml", "uv.toml", "uv.lock", "pixi.lock" },
	init_options = {
		settings = {
			experimental = {
				completions = {
					enable = true
				}
			}
			-- 禁用 ruff 的 linting (诊断) 功能，只保留格式化。
			-- 如果您有其他 ruff 设置 (例如来自 pyproject.toml)，
			-- 服务器通常会自动加载它们。
			-- 您也可以在这里覆盖它们。
		},
	},
}
