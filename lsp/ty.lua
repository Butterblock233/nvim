return {
	-- Command and arguments to start the server.
	-- Filetypes to automatically attach to.
	name = "ty",
	cmd = { "ty", "server" },
	filetypes = { "python" },
	root_markers = { ".git", "pyproject.toml", "pixi.toml", "uv.toml", "uv.lock", "pixi.lock" },
	init_options = {
		settings = {},
	},
}
