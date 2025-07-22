--[[ local cmp = require('cmp')
local lspkind = require('lspkind')
local types = require('cmp.types') ]]
return {
	--cmp--
	{
		"hrsh7th/cmp-nvim-lsp",
		-- after = "neovim/nvim-lspconfig",
		event = {
			"InsertEnter",
			"CmdlineEnter",
		},
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/nvim-cmp",
			"saadparwaiz1/cmp_luasnip",
			"onsails/lspkind.nvim",
			-- "neovim/nvim-lspconfig",
		},
		config = function()
			require("config.cmp").setup()
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		build = function()
			if vim.fn.executable("make") == 1 then
				vim.fn.system({ "make", "install_jsregexp" })
			else
				vim.notify("GNU Make not found. Cannot build LuaSnip jsregexp module.", vim.log.levels.WARN)
			end
		end,
		opts = {
			history = true,
		},
		keys = {
			{
				"<Tab>",
				function()
					local cmp = require("cmp")
					local ls = require("luasnip")
					if cmp.visible() then
						cmp.confirm()
					elseif ls.expand_or_jumpable() then
						ls.expand_or_jump()
					else
						vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", true)
					end
				end,
				mode = { "i", "s" },
				desc = "Super Tab: cmp confirm / luasnip jump / insert Tab",
				silent = true,
			},
			{
				"<S-Tab>",
				function()
					local ls = require("luasnip")
					if ls.jumpable(-1) then
						ls.jump(-1)
					else
						vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<S-Tab>", true, false, true), "n", true)
					end
				end,
				mode = { "i", "s" },
				desc = "Super Tab: luasnip jump back / insert S-Tab",
				silent = true,
			},
			{
				"<C-e>",
				function()
					local ls = require("luasnip")
					if ls.choice_active() then
						ls.change_choice(1)
					end
				end,
				mode = { "i", "s" },
				desc = "LuaSnip jump back or jump to last active snippet",
				silent = true,
			},
		},
	},
}
