local lspkind = require'lspkind'
local cmp=require'cmp'
cmp.setup{
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
      { name = 'path' }
    }
  ),
  -- 使用lspkind-nvim显示类型图标
  formatting = {
    format = lspkind.cmp_format({
      with_text = true, -- do not show text alongside icons
      maxwidth = 50,    -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
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
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    -- 下一个
    ['<C-j>'] = cmp.mapping.select_next_item(),
    -- 出现补全
    ['<A-.>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    -- 取消
    ['<A-,>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- 确认
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ['<Tab>'] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace
    }),
    -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
  },
  -- load vscode snippet (friendly-snippet)
--require("luasnip.loaders.from_vscode").lazy_load()
}
