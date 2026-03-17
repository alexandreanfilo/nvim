local o = vim.opt

-- Editor options
o.number = true
o.relativenumber = true
o.clipboard = "unnamedplus"
o.autoindent = true
o.cursorline = true
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2
o.mouse = "a"
o.title = true
o.ttimeoutlen = 50
o.wildmenu = true
o.showmatch = true
o.inccommand = "split"
o.splitright = true
o.splitbelow = true
o.termguicolors = true

-- Modern defaults
o.ignorecase = true -- Ignore case in search patterns
o.smartcase = true -- Override ignorecase if search pattern contains upper case characters
o.scrolloff = 8 -- Minimum number of screen lines to keep above and below the cursor
o.sidescrolloff = 8
o.swapfile = false -- Disable swap files
o.backup = false -- Disable backup files
o.undofile = true -- Save undo history to a file
o.updatetime = 250 -- Faster completion and diagnostic messages
o.timeoutlen = 300 -- Time to wait for a mapped sequence to complete (in milliseconds)
o.signcolumn = "yes" -- Always show the sign column, otherwise it would shift the text each time
o.wrap = false -- Disable line wrapping
o.completeopt = { "menuone", "noselect" } -- Set completeopt to have a better completion experience
