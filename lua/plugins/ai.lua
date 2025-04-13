return {
    {
        "Exafunction/codeium.nvim",
        cond = function()
            return vim.env.CODEIUM ~= nil and vim.env.CODEIUM ~= ""
        end,
        dependencies = {
            "nvim-lua/plenary.nvim", -- 必要依赖
            "hrsh7th/nvim-cmp",      -- cmp 集成
            "ellisonleao/dotenv.nvim", -- 加载 .env 文件
        },
        lazy = true,
        event = "InsertEnter", -- 按需加载
		opts = {}
    },
}
