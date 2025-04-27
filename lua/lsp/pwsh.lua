return {
	cmd = {
		"pwsh",
		"-NoLogo",
		"-NoProfile",
		"-Command",
		"~/AppData/Local/nvim-data/mason/packages/powershell-editor-services/PowerShellEditorServices/Start-EditorServices.ps1",
	},
	filetypes = { "ps1", "psm1", "psd1" },
}
