local conf = require("config.lsp.lsp_signature")

return {
    "ray-x/lsp_signature.nvim",
    cond = true,
    event = "InsertEnter",
    opts = conf.opts, -- 直接传递 conf.opts
    keys = conf.keys, -- 修正拼写错误，传递 conf.keys
    config = function ()
		require("lsp_signature").setup(conf.opts)
		-- require("lsp_signature").on_attach(conf.on_attach
		end,
}
