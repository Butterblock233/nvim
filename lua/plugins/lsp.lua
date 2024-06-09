return {
  {
    'junnplus/lsp-setup.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',        -- optional
      'williamboman/mason-lspconfig.nvim', -- optional
    },
    config = {
      servers = {
        clangd = {},
        lua_ls = {

          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME
              -- Depending on the usage, you might want to add additional paths here.
              -- "${3rd}/luv/library"
              -- "${3rd}/busted/library",
            }

          }
        },
        powershell_es = {},
      }
    }
  }
}
--[[ return {
  {
    "williamboman/mason.nvim",
    config = {
      function()
        require("mason").setup() {
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗"
            }
          }
        }
      end,
    }
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = {
      function()
        require("mason-lspconfig").setup {
          ensure_installed = { "lua_ls", "rust_analyzer" },
        }
      end
    }
  },

  {
    "neovim/nvim-lspconfig",
    config = {
      function()
        local lspconfig = require('lspconfig')
        lspconfig.lua_ls.setup {
          -- Server-specific settings. See `:help lspconfig-setup`
          settings = {
            ['lua_ls'] = {},
          },
        }
      end
    },
  },


} ]]
