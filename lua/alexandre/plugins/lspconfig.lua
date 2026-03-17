return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "folke/lazydev.nvim", ft = "lua", opts = {} },
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        local nvim_lsp = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")

        local on_attach = function(_, bufnr)
            local opts = { buffer = bufnr, silent = true }
            local map = vim.keymap.set

            map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration", buffer = bufnr })
            map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition", buffer = bufnr })
            map("n", "K", vim.lsp.buf.hover, { desc = "Hover docs", buffer = bufnr })
            map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation", buffer = bufnr })
            map("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature help", buffer = bufnr })
            map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol", buffer = bufnr })
            map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions", buffer = bufnr })
            map("n", "gr", vim.lsp.buf.references, { desc = "Go to references", buffer = bufnr })
            map("n", "gl", vim.diagnostic.open_float, { desc = "Open diagnostic float", buffer = bufnr })
            map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic", buffer = bufnr })
            map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic", buffer = bufnr })
        end

        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        mason_lspconfig.setup_handlers({
            function(server)
                nvim_lsp[server].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                })
            end,
            ["ts_ls"] = function()
                nvim_lsp["ts_ls"].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end,
            ["lua_ls"] = function()
                nvim_lsp["lua_ls"].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                    settings = {
                        Lua = {
                            diagnostics = { globals = { "vim" } },
                            completion = { callSnippet = "Replace" },
                        },
                    },
                })
            end,
        })
    end,
}
