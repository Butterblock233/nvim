require('lazy').setup({
   "navarasu/onedark.nvim";
   "hrsh7th/nvim-cmp";
   "williamboman/mason.nvim";
   "neovim/nvim-lspconfig";
   {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",}
    }
    "folke/noice.nvim"
})
