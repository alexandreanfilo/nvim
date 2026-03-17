return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")

        telescope.setup({
            defaults = {
                path_display = { "truncate " },
            },
        })

        telescope.load_extension("fzf")

        -- set keymaps
        local map = vim.keymap.set

        map("n", "<leader>ff", builtin.find_files, { desc = "Find files in cwd" })
        map("n", "<leader>fr", builtin.oldfiles, { desc = "Find recent files" })
        map("n", "<leader>fg", builtin.live_grep, { desc = "Find string in cwd (grep)" })
        map("n", "<leader>fc", builtin.grep_string, { desc = "Find string under cursor" })
        map("n", "<leader>fb", builtin.buffers, { desc = "Find open buffers" })
        map("n", "<leader>fh", builtin.help_tags, { desc = "Find help tags" })
        map("n", "<leader>fs", builtin.git_status, { desc = "Find git status" })
    end,
}
