local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}
map=vim.keymap.set
-- 插件设置 -- 
map('n','<C-b>',':Neotree<CR>',opts)
map('i','<C-b>','<cmd>Neotree<CR><Esc>',opts)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

---- nvim-cmp 自动补全
--pluginKeys.cmp = function(cmp)
--  return {
--    -- 上一个
--    ['<C-k>'] = cmp.mapping.select_prev_item(),
--    -- 下一个
--    ['<C-j>'] = cmp.mapping.select_next_item(),
--    -- 出现补全
--    ['<A-.>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
--    -- 取消
--    ['<A-,>'] = cmp.mapping({
--      i = cmp.mapping.abort(),
--      c = cmp.mapping.close(),
--    }),
--    -- 确认
--    -- Accept currently selected item. If none selected, `select` first item.
--    -- Set `select` to `false` to only confirm explicitly selected items.
--    ['<CR>'] = cmp.mapping.confirm({
--      select = true ,
--      behavior = cmp.ConfirmBehavior.Replace
--    }),
--    -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
--    ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
--    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
--  }
--end