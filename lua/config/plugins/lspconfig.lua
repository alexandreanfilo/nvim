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
        local mason_lspconfig = require("mason-lspconfig")

        -- 1. Base Mason setup
        require("mason").setup()

        -- 2. Mason-LSPConfig setup with server list
        mason_lspconfig.setup({
            automatic_installation = true,
            ensure_installed = {
                "cssls",
                "eslint",
                "html",
                "jsonls",
                "ts_ls",
                "pyright",
                "tailwindcss",
                "lua_ls",
            },
        })

        local on_attach = function(_, bufnr)
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

        -- 3. Modern Neovim 0.11+ configuration
        -- We use vim.lsp.config and vim.lsp.enable instead of the deprecated nvim-lspconfig[server].setup()
        
        -- Custom configurations
        vim.lsp.config["lua_ls"] = {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" } },
                    completion = { callSnippet = "Replace" },
                },
            },
        }

        vim.lsp.config["ts_ls"] = {
            on_attach = on_attach,
            capabilities = capabilities,
        }

        -- Default configuration for other servers
        mason_lspconfig.setup_handlers({
            function(server)
                -- If we haven't already defined a config for this server, use a generic one
                if not vim.lsp.config[server] then
                    vim.lsp.config[server] = {
                        on_attach = on_attach,
                        capabilities = capabilities,
                    }
                end
                -- Enable the server
                vim.lsp.enable(server)
            end,
        })
    end,
}
