# 🚀 Modern Neovim Configuration

A high-performance, developer-centric Neovim configuration built with Lua, focused on speed, aesthetics, and a seamless development experience.

## 🛠️ Tech Stack

- **Plugin Manager:** [lazy.nvim](https://github.com/folke/lazy.nvim)
- **LSP & Tooling:** [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig), [mason.nvim](https://github.com/williamboman/mason.nvim), [lazydev.nvim](https://github.com/folke/lazydev.nvim)
- **Autocompletion:** [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) with [LSPKind](https://github.com/onsails/lspkind.nvim) icons
- **Formatting:** [conform.nvim](https://github.com/stevearc/conform.nvim) (Prettier, Black, Stylua)
- **Syntax Highlighting:** [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- **Fuzzy Finder:** [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) (with FZF native)
- **Git:** [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- **File Explorer:** [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
- **UI & Theme:** [tokyodark.nvim](https://github.com/tiagovla/tokyodark.nvim), [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim), [nvim-colorizer.lua](https://github.com/NvChad/nvim-colorizer.lua)

## ✨ Key Features

- **Persistent Undo:** Never lose your changes across sessions (`undofile`).
- **Smart Search:** Case-insensitive search that automatically becomes case-sensitive if you use capitals.
- **Auto-Formatting:** Optimized for Prettier (JS/TS/CSS/HTML), Black/Isort (Python), and Stylua (Lua).
- **Modern Completion:** VS Code-like icons and automatic parentheses insertion for functions.
- **Optimized UI:** Fast startup, signcolumn enabled, and faster update times for snappier diagnostics.
- **Better Navigation:** Smart `j`/`k` movements for wrapped lines and enhanced window management.

## ⌨️ Keybindings

The `<leader>` key is set to `Space`.

### General
| Mapping | Description |
| --- | --- |
| `<leader>w` | Save file |
| `<leader>q` | Quit |
| `jk` | Exit insert mode |
| `<Esc>` | Clear search highlights |
| `<leader>f` | Format file or range |

### Navigation & Windows
| Mapping | Description |
| --- | --- |
| `j` / `k` | Smart navigation for wrapped lines |
| `<C-h/j/k/l>` | Navigate between windows |
| `<C-Up/Down>` | Resize window height |
| `<C-Left/Right>` | Resize window width |
| `<leader>o` | Vertical split |
| `<leader>p` | Horizontal split |

### LSP (IntelliSense)
| Mapping | Description |
| --- | --- |
| `gd` | Go to definition |
| `gr` | Go to references |
| `K` | Hover documentation |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code actions |
| `gl` | Show line diagnostics |
| `[d` / `]d` | Previous/Next diagnostic |

### Telescope (Fuzzy Find)
| Mapping | Description |
| --- | --- |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep (Search in project) |
| `<leader>fr` | Recent files |
| `<leader>fb` | Open buffers |
| `<leader>fc` | Search string under cursor |
| `<leader>fs` | Git status |

### Git (Gitsigns)
| Mapping | Description |
| --- | --- |
| `]c` / `[c` | Next/Prev hunk |
| `<leader>hp` | Preview hunk |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hb` | Blame line |

### File Explorer
| Mapping | Description |
| --- | --- |
| `<leader>e` | Toggle NeoTree |
| `<leader>r` | Focus NeoTree |

## 🚀 Installation & Setup

1. **Prerequisites:**
   - Neovim 0.9.0+
   - `ripgrep` (for Telescope grep)
   - `build-essential` (for FZF native build)
   - A Nerd Font (e.g., JetBrainsMono Nerd Font)

2. **Setup:**
   ```bash
   # Clone the config if starting fresh
   git clone <your-repo-url> ~/.config/nvim

   # Open Neovim and install plugins
   nvim +":Lazy sync"
   ```

3. **Verify LSP/Tools:**
   Run `:Mason` to see installed servers and tools.
# nvim
