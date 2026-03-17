return {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "windwp/nvim-ts-autotag",
    },
    opts = {
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        ensure_installed = {
            "json", "javascript", "typescript", "tsx", "yaml",
            "html", "css", "markdown", "markdown_inline",
            "bash", "lua", "vim", "dockerfile", "gitignore",
            "c", "rust", "python"
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<C-space>",
                node_incremental = "<C-space>",
                scope_incremental = false,
                node_decremental = "<bs>",
            },
        },
    },
    config = function(_, opts)
        -- In recent versions of nvim-treesitter, the module is just 'nvim-treesitter.configs' 
        -- but some versions/installs might require the main module.
        local status_ok, configs = pcall(require, "nvim-treesitter.configs")
        if status_ok then
            configs.setup(opts)
        else
            require("nvim-treesitter").setup(opts)
        end
        
        require("nvim-ts-autotag").setup()
    end,
}
