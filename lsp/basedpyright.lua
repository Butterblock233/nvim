return {
	-- Command and arguments to start the server.
	-- IMPORTANT: Changed from { "basedpyright --stdio" } to { "basedpyright-langserver", "--stdio" }
	cmd = { "basedpyright-langserver", "--stdio" },
	-- Filetypes to automatically attach to.
	filetypes = { "python" },
	root_markers = { ".git", "pyproject.toml", "pixi.toml", "uv.toml", "uv.lock", "pixi.lock" },
	settings = {
		basedpyright = {
			analysis = {
				---@type "strict" | "standard" | "basic"
				typeCheckingMode = "standard",
				inlayHints = {
					callArgumentNames = true,
				},
				-- 移除这些警告的设置，因为它们可能不再被支持或已整合
				-- reportMissingImports = true,
				-- reportMissingTypeStubs = true,
			},
			useLibraryCodeForTypes = true,
			-- 移除不支持的 'language' 设置
			-- language = "zh",
		},
	},
}
