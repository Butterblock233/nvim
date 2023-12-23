require('lazy').setup({
	"navarasu/onedark.nvim";
	"williamboman/mason.nvim";
	"neovim/nvim-lspconfig";
	"nvim-telescope/telescope.nvim",
	"yamatsum/nvim-nonicons",
	"williamboman/mason-lspconfig.nvim",
	"akinsho/bufferline.nvim",
	-- nvim-cmp
	'neovim/nvim-lspconfig',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/nvim-cmp',
	'rafamadriz/friendly-snippets',
	'onsails/lspkind-nvim',
	'jiangmiao/auto-pairs',
	'L3MON4D3/LuaSnip',
	'saadparwaiz1/cmp_luasnip',
	'onsails/lspkind-nvim',
	--
   {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
	"nvim-lua/plenary.nvim",
	"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	"MunifTanjim/nui.nvim";}
};
{
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
},
--[[{
	"neoclide/coc.nvim",
	"clangd/coc-clangd",
--}]]
	--[[{
		"folke/noice.nvim",
	  event = "VeryLazy",
	  opts = {
		-- add any options here
	  },
	  dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",}
	}] --]]
})
