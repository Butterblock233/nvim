local M = {}


function M.setup_lsp(name, opts)
	vim.lsp.config(name, opts)
	vim.lsp.enable(name)
end

return M
