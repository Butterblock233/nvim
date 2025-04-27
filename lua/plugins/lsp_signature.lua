local conf = require("config.lsp.utils.lsp_signature")

return {
	"ray-x/lsp_signature.nvim",
	cond = true,
	event = "InsertEnter",
	opts = conf.opts,
	keys = conf.keys,
	config = function()
		require("lsp_signature").setup(conf.opts)
		-- require("lsp_signature").on_attach(conf.on_attach
	end,
}
