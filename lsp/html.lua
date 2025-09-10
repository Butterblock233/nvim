return {
	name = "html",
	cmd = { "vscode-html-language-server", "--stdio" },
	init_options = {},
	settings = {
		hover = {
			documentation = true,
			references = false,
		},
	},
}
