return {
	-- Command and arguments to start the server.
	cmd = { "basedpyright" },
	-- Filetypes to automatically attach to.
	filetypes = { "python" },
	settings = {
		basedpyright = {
			-- 指定 Python 解释器路径（可选）
			-- pythonPath = vim.fn.expand("~/.pyenv/versions/neovim/bin/python"),
			-- 启用类型检查
			--- @type "basic" | "strict"
			typeCheckingMode = "strict", -- 设置语言
			--- @type "zh" | "en" | "ja"
			language = "zh", -- 可选值：en / zh / ja / 等
			-- 其他配置
			useLibraryCodeForTypes = true,
			reportMissingImports = true,
			reportMissingTypeStubs = true,
		},
	},
}
