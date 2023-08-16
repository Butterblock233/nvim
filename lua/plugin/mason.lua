require("mason-lspconfig").setup({
	ensure_installed = {
	"lua_ls",
    "bashls",
    "jdtls",
    "hls",
    "clangd",
    "cmake",
    "pyright",
	},
})

local lspconfig = require('lspconfig')

require("mason-lspconfig").setup_handlers({
  function (server_name)
    require("lspconfig")[server_name].setup{}
  end,
  -- Next, you can provide targeted overrides for specific servers.
  ["lua_ls"] = function ()
    lspconfig.lua_ls.setup {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }
          }
        }
    }
  }
  end,
  ["clangd"] = function ()
    lspconfig.clangd.setup {
      cmd = {
        "clangd",
        "--header-insertion=never",
        --"--query-driver=/opt/homebrew/opt/llvm/bin/clang",
        "--all-scopes-completion",
        "--completion-style=detailed",
      }
    }
  end
})
