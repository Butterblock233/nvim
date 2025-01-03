local M = {}

function M.setup()
	local cmp = require('cmp')
	local lspkind = require('lspkind')
	local types = require('cmp.types')
	local compare = require('cmp.config.compare')

	cmp.setup {

		preselect = types.cmp.PreselectMode.Item,
		--默认选择第一项
		completion = {
			completeopt = 'menu,menuone,noinsert'
		},
		snippet = {
			expand = function(args)
				-- 以下插件作为前提：
				-- { 'L3MON4D3/LuaSnip' },
				-- { 'saadparwaiz1/cmp_luasnip' },
				require('luasnip').lsp_expand(args.body)
			end,
		},
		-- 来源
		sources = cmp.config.sources(
			{
				{ name = 'nvim_lsp' },
				-- 以下插件作为前提：
				-- { 'L3MON4D3/LuaSnip' },
				-- { 'saadparwaiz1/cmp_luasnip' },
				{ name = 'luasnip' },
			},
			{
				{ name = 'buffer' },
				{ name = 'path' },
				{name = 'codeium'}
			}
		),
		-- 使用lspkind-nvim显示类型图标
		formatting = {
			format = lspkind.cmp_format({
				with_text = true, -- do not show text alongside icons
				maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
				before = function(entry, vim_item)
					-- Source 显示提示来源
					vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
					return vim_item
				end
			})
		},
		-- 快捷键绑定
		mapping = {
			-- 上一个
			['<C-p>'] = cmp.mapping.select_prev_item(),
			['<Up>'] = cmp.mapping.select_prev_item(),
			-- 下一个
			['<C-n>'] = cmp.mapping.select_next_item(),
			['<Down>'] = cmp.mapping.select_next_item(),
			-- 出现补全
			['<C-Space>'] = cmp.mapping.complete(),
			-- 取消
			['<C-g>'] = cmp.mapping({
				i = cmp.mapping.abort(),
				c = cmp.mapping.close(),
			}),
			-- 确认
			-- Accept currently selected item. If none selected, `select` first item.
			-- Set `select` to `false` to only confirm explicitly selected items.
			['<tab>'] = cmp.mapping.confirm({
				select = true,
				behavior = cmp.ConfirmBehavior.Replace
			}),
			-- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
			['<C-j>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
			['<C-k>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
			-- ['<C-j>'] = cmp.scroll_docs
		},
		sorting = {
			priority_weight = 2,
			comparators = {
				compare.offset,
				compare.exact,
				-- compare.scopes,
				compare.score,
				compare.recently_used,
				compare.locality,
				compare.kind,
				-- compare.sort_text,
				compare.length,
				compare.order,
			},
		},
	}
end

return M
