return {
	-- Command and arguments to start the server.
	-- Filetypes to automatically attach to.
	name = "kotlin",
	cmd = { "kotlin-lsp", "--stdio"},
	filetypes = { "kotlin" },
	root_markers = {".git", "gradlew"},
}
