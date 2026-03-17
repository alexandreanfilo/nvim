vim.g.mapleader = " "

local map = vim.keymap.set

-- General
map("n", "<leader>w", "<CMD>update<CR>", { desc = "Save file" })
map("n", "<leader>q", "<CMD>q<CR>", { desc = "Quit" })
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })
map("n", "<Esc>", "<CMD>nohlsearch<CR>", { desc = "Clear search highlight" })

-- Better navigation for wrapped lines
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- NeoTree
map("n", "<leader>e", "<CMD>Neotree toggle<CR>", { desc = "Toggle NeoTree" })
map("n", "<leader>r", "<CMD>Neotree focus<CR>", { desc = "Focus NeoTree" })

-- New Windows
map("n", "<leader>o", "<CMD>vsplit<CR>", { desc = "Vertical split" })
map("n", "<leader>p", "<CMD>split<CR>", { desc = "Horizontal split" })

-- Window Navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })

-- Resize Windows
map("n", "<C-Up>", "<CMD>resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-Down>", "<CMD>resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<CMD>vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<CMD>vertical resize +2<CR>", { desc = "Increase window width" })

-- Indent
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })
