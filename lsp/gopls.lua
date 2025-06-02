-- https://github.com/golang/tools/blob/master/gopls/doc/vim.md#custom-configuration
return {
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gosum", "gotmpl", "gowork" },
	root_markers = { ".git", "Makefile" },
	-- on_attach = function(client, buf)
	-- 	vim.lsp.inlay_hint.enable(true, { bufnr = buf })
	-- end,
	-- https://github.com/golang/tools/blob/master/gopls/doc/vim.md#custom-configuration

	-- gopls settings for Neovim LSP configuration
	settings = {
		gopls = {
			-- 'analyses' enable various static analysis checks that provide diagnostics (warnings, suggestions).
			-- Setting these to 'true' means they are enabled. They can consume resources but offer valuable code insights.
			analyses = {
				nilness = true, -- Checks for potential nil pointer dereferences. Highly recommended. (Often default)
				unusedparams = true, -- Flags unused function parameters. Helps keep code clean. (Often default)
				unusedwrite = true, -- Detects writes to variables that are never read. Useful for finding logical bugs. (Often default)
				useany = true, -- Suggests refactoring 'interface{}' to 'any' for Go 1.18+ projects. (Often default)
			},

			-- 'codelenses' display clickable actions directly in your code, providing quick access to common tasks.
			codelenses = {
				gc_details = false, -- Shows garbage collection details. Primarily for performance tuning. (Default: false)
				generate = true, -- Displays a "go generate" CodeLens above relevant code. (Often default)
				regenerate_cgo = true, -- For CGO projects, shows a CodeLens to regenerate CGO bindings. (Often default if CGO is used)
				run_govulncheck = true, -- Shows a CodeLens in go.mod to run 'govulncheck' for security vulnerabilities. (Often default)
				test = true, -- Displays "run test" and "debug test" CodeLenses above test functions. (Often default)
				tidy = true, -- Shows a CodeLens in go.mod to run 'go mod tidy'. (Often default)
				upgrade_dependency = true, -- Displays a CodeLens in go.mod to upgrade dependencies. (Often default)
				vendor = true, -- Shows a CodeLens in go.mod to run 'go mod vendor'. (Often default)
			},

			-- 'completeUnimported' allows gopls to suggest symbols from packages you haven't explicitly imported yet.
			-- If a suggestion is accepted, gopls automatically adds the import statement.
			completeUnimported = true, -- Highly convenient for faster coding. (Often default)

			-- 'directoryFilters' tell gopls to ignore specific directories during indexing.
			-- This significantly improves performance by reducing the amount of code gopls has to process.
			directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" }, -- Crucial for performance. (Highly recommended)

			-- 'gofumpt' enables using 'gofumpt' as the formatting tool instead of the standard 'go fmt'.
			-- 'gofumpt' enforces stricter formatting rules.
			gofumpt = true, -- Optional, depends on your team's formatting preference. (Default is 'go fmt')

			-- 'hints' display inline type and parameter information directly in your code, enhancing readability.
			hints = {
				assignVariableTypes = true, -- Shows the inferred type when assigning variables. (Often default)
				compositeLiteralFields = true, -- Displays field names in composite literals (e.g., struct initializers). (Often default)
				compositeLiteralTypes = true, -- Shows type names in composite literals. (Often default)
				constantValues = true, -- Displays the actual value of constants. (Often default)
				functionTypeParameters = true, -- Shows type parameters in generic function calls. (Often default)
				parameterNames = true, -- Displays parameter names during function calls. (Often default)
				rangeVariableTypes = true, -- Shows variable types in 'for ... range' loops. (Often default)
			},

			-- 'semanticTokens' enables semantic highlighting, allowing for more precise syntax coloring based on code meaning.
			semanticTokens = true, -- Improves code readability. (Often default)

			-- 'staticcheck' enables additional static analysis checks provided by the 'staticcheck' tool.
			-- This can find more subtle issues than the built-in Go compiler checks.
			staticcheck = true, -- Very useful for code quality. Can be resource-intensive on large projects. (Often default in recent gopls versions)

			-- 'usePlaceholders' inserts placeholders for function arguments during autocompletion.
			-- This allows you to quickly navigate through arguments using tab.
			usePlaceholders = true, -- Improves completion efficiency. (Often default)
		},
	},
	-- 'single_file_support' allows gopls to provide features even when a single Go file is opened outside of a module.
	single_file_support = true, -- Convenient for quick edits or viewing individual files. (Often default)
}
