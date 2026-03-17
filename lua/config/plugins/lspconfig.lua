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

        -- Helper to configure and enable a server lazily
        local function setup_server(server)
            if not vim.lsp.config[server] then
                local config = {
                    on_attach = on_attach,
                    capabilities = capabilities,
                }
                
                if server == "lua_ls" then
                    config.settings = {
                        Lua = {
                            diagnostics = { globals = { "vim" } },
                            completion = { callSnippet = "Replace" },
                        },
                    }
                end
                
                vim.lsp.config[server] = config
            end
            vim.lsp.enable(server)
        end

        -- Map of filetypes to LSP server names
        local ft_map = {
            lua = "lua_ls",
            javascript = "ts_ls",
            typescript = "ts_ls",
            javascriptreact = "ts_ls",
            typescriptreact = "ts_ls",
            python = "pyright",
            html = "html",
            css = "cssls",
            json = "jsonls",
            yaml = "yamlls",
            markdown = "marksman",
        }

        -- Load server only when filetype is detected
        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                local server = ft_map[args.match]
                if server then
                    setup_server(server)
                end
            end,
        })
        
        -- Fallback for servers not in ft_map but installed
        for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
            setup_server(server)
        end

        -- Handle servers installed later via UI
        vim.api.nvim_create_autocmd("User", {
            pattern = "MasonLspConfigServerInstalled",
            callback = function(args)
                setup_server(args.data.server_name)
            end,
        })
    end,
}
