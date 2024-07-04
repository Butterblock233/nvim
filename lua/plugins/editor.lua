return {
  'nvim-neo-tree/neo-tree.nvim',
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  --cmd = "Neotree",
  keys = {
    {
      "<leader>e",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
      end,
      desc = "Explorer NeoTree (cwd)",
    },
  },
  config = {
    default_component_configs = {
      git_status = {
        symbols = {
          -- Change type
          added     = "✚",
          deleted   = "D  ",
          modified  = "M",
          renamed   = "󰑕",
          -- Status type
          untracked = "U",
          ignored   = "",
          unstaged  = "",
          staged    = "",
          conflict  = "",
        }
      }
    }

  }
}
