-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

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
---@class MasonSettings
local DEFAULT_SETTINGS = {
  ---@since 1.0.0
  -- The directory in which to install packages.
  --install_root_dir = path.concat { vim.fn.stdpath "data", "mason" },

  ---@since 1.0.0
  -- Where Mason should put its bin location in your PATH. Can be one of:
  -- - "prepend" (default, Mason's bin location is put first in PATH)
  -- - "append" (Mason's bin location is put at the end of PATH)
  -- - "skip" (doesn't modify PATH)
  ---@type '"prepend"' | '"append"' | '"skip"'
  PATH = "prepend",

  ---@since 1.0.0
  -- Controls to which degree logs are written to the log file. It's useful to set this to vim.log.levels.DEBUG when
  -- debugging issues with package installations.
  log_level = vim.log.levels.INFO,

  ---@since 1.0.0
  -- Limit for the maximum amount of packages to be installed at the same time. Once this limit is reached, any further
  -- packages that are requested to be installed will be put in a queue.
  max_concurrent_installers = 4,

  ---@since 1.0.0
  -- [Advanced setting]
  -- The registries to source packages from. Accepts multiple entries. Should a package with the same name exist in
  -- multiple registries, the registry listed first will be used.
  registries = {
    "github:mason-org/mason-registry",
  },

  ---@since 1.0.0
  -- The provider implementations to use for resolving supplementary package metadata (e.g., all available versions).
  -- Accepts multiple entries, where later entries will be used as fallback should prior providers fail.
  -- Builtin providers are:
  --   - mason.providers.registry-api  - uses the https://api.mason-registry.dev API
  --   - mason.providers.client        - uses only client-side tooling to resolve metadata
  providers = {
    "mason.providers.registry-api",
    "mason.providers.client",
  },

  github = {
    ---@since 1.0.0
    -- The template URL to use when downloading assets from GitHub.
    -- The placeholders are the following (in order):
    -- 1. The repository (e.g. "rust-lang/rust-analyzer")
    -- 2. The release version (e.g. "v0.3.0")
    -- 3. The asset name (e.g. "rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz")
    download_url_template = "https://github.com/%s/releases/download/%s/%s",
  },

  pip = {
    ---@since 1.0.0
    -- Whether to upgrade pip to the latest version in the virtual environment before installing packages.
    upgrade_pip = false,

    ---@since 1.0.0
    -- These args will be added to `pip install` calls. Note that setting extra args might impact intended behavior
    -- and is not recommended.
    --
    -- Example: { "--proxy", "https://proxyserver" }
    install_args = {},
  },

  ui = {
    ---@since 1.0.0
    -- Whether to automatically check for new versions when opening the :Mason window.
    check_outdated_packages_on_open = true,

    ---@since 1.0.0
    -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
    border = "none",

    ---@since 1.0.0
    -- Width of the window. Accepts:
    -- - Integer greater than 1 for fixed width.
    -- - Float in the range of 0-1 for a percentage of screen width.
    width = 0.8,

    ---@since 1.0.0
    -- Height of the window. Accepts:
    -- - Integer greater than 1 for fixed height.
    -- - Float in the range of 0-1 for a percentage of screen height.
    height = 0.9,

    -- icons = {
    --     ---@since 1.0.0
    --     -- The list icon to use for installed packages.
    --     package_installed = "◍",
    --     ---@since 1.0.0
    --     -- The list icon to use for packages that are installing, or queued for installation.
    --     package_pending = "◍",
    --     ---@since 1.0.0
    --     -- The list icon to use for packages that are not installed.
    --     package_uninstalled = "◍",
    -- },

    keymaps = {
      ---@since 1.0.0
      -- Keymap to expand a package
      toggle_package_expand = "<CR>",
      ---@since 1.0.0
      -- Keymap to install the package under the current cursor position
      install_package = "i",
      ---@since 1.0.0
      -- Keymap to reinstall/update the package under the current cursor position
      update_package = "u",
      ---@since 1.0.0
      -- Keymap to check for new version for the package under the current cursor position
      check_package_version = "c",
      ---@since 1.0.0
      -- Keymap to update all installed packages
      update_all_packages = "U",
      ---@since 1.0.0
      -- Keymap to check which installed packages are outdated
      check_outdated_packages = "C",
      ---@since 1.0.0
      -- Keymap to uninstall a package
      uninstall_package = "X",
      ---@since 1.0.0
      -- Keymap to cancel a package installation
      cancel_installation = "<C-c>",
      ---@since 1.0.0
      -- Keymap to apply language filter
      apply_language_filter = "<C-f>",
      ---@since 1.1.0
      -- Keymap to toggle viewing package installation log
      toggle_package_install_log = "<CR>",
      ---@since 1.8.0
      -- Keymap to toggle the help view
      toggle_help = "g?",
    },
  },
}
local M = {
  {
    {
      "williamboman/mason.nvim",
      config = function()
      end
    },
    {
      "williamboman/mason-lspconfig.nvim",
    },
    {
      "neovim/nvim-lspconfig",
      config = function()
        -- 设置 mason
        require("mason").setup()

        -- 设置 mason-lspconfig
        require("mason-lspconfig").setup({
          ensure_installed = { "lua_ls", "pyright" } -- 指定需要自动安装的 LSP 服务器
        })

        -- 自动配置已安装的 LSP 服务器
        local lspconfig = require("lspconfig")

        require("mason-lspconfig").setup_handlers({
          -- 默认处理器（可选）
          function(server_name) -- 自动安装的 LSP 服务器会这样设置；server_name represents mason-lspconfig.nvim known server name
            lspconfig[server_name].setup {}
          end,

          -- 覆盖默认处理器（示例）
          ["lua_ls"] = function()
            lspconfig.lua_ls.setup {
              on_init = function(client)
                local path = client.workspace_folders[1].name
                if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
                  return
                end

                client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                  runtime = {
                    -- Tell the language server which version of Lua you're using
                    -- (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT'
                  },
                  -- Make the server aware of Neovim runtime files
                  workspace = {
                    checkThirdParty = false,
                    library = {
                      vim.env.VIMRUNTIME
                      -- Depending on the usage, you might want to add additional paths here.
                      -- "${3rd}/luv/library"
                      -- "${3rd}/busted/library",
                    }
                    -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                    -- library = vim.api.nvim_get_runtime_file("", true)
                  }
                })
              end,
              settings = {
                Lua = {}
              }
            }
          end,
        })
      end
    }
  }
}
return M
