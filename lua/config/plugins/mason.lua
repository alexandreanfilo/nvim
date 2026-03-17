return {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    dependencies = {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        require("mason").setup()

        require("mason-tool-installer").setup({
            ensure_installed = {
                "prettier",
                "stylua",
                "isort",
                "black",
                "eslint_d",
            },
        })
    end,
}
