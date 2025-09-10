return {
	-- Command and arguments to start the server.
	-- Filetypes to automatically attach to.
	name = "cue",
	cmd = { "cue", "lsp" },
	filetypes = { "cue" },
	root_markers = {".git"},
}
