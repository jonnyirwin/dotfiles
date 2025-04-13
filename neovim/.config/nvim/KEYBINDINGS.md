# Neovim Keybindings

This document provides a comprehensive list of keybindings used in this Neovim configuration.

## Key Namespaces

| Prefix          | Purpose                       |
|-----------------|-------------------------------|
| `<leader>f`     | Find (Telescope)              |
| `<leader>g`     | Git                           |
| `<leader>c`     | Code/Copilot                  |
| `<leader>b`     | Buffer                        |
| `<leader>w`     | Window                        |
| `<leader>r`     | Rails/Ruby                    |
| `<leader>d`     | Diagnostics/Debug             |
| `<leader>t`     | Test                          |
| `<leader>x`     | Terminal                      |
| `<leader>a`     | Tabs                          |
| `<leader>i`     | Swap/Sort                     |
| `<leader>u`     | UI Toggles                    |
| `<leader>h`     | Hunks (Git)                   |
| `<leader>p`     | Project/Files                 |
| `<leader>o`     | Oil File Explorer             |
| `<leader>v`     | Vimux                         |
| `<leader>m`     | Manage/Motion                 |

## File Navigation

- `<leader>pv` - Open Oil file explorer
- `-` - Open parent directory in Oil
- `<leader>pf` - Open Oil in float window
- `<leader>os` - Open Oil in horizontal split
- `<leader>o|` - Open Oil in vertical split

## Window Management

- `<leader>wv` - Split window vertically
- `<leader>wh` - Split window horizontally
- `<leader>we` - Make splits equal size
- `<leader>wx` - Close current split
- `<C-h/j/k/l>` - Navigate between windows/tmux panes

## Tab Management

- `<leader>ao` - Open new tab
- `<leader>ax` - Close current tab
- `<leader>an` - Go to next tab
- `<leader>ap` - Go to previous tab

## Find with Telescope

- `<leader>ff` - Find files
- `<leader>fg` - Find text (grep)
- `<leader>fb` - Find buffers
- `<leader>fh` - Find help
- `<leader>fo` - Find recent files
- `<leader>fc` - Find current word
- `<leader>fd` - Find diagnostics
- `<leader>fs` - Find document symbols

## Git

- `<leader>gg` - Git status (fugitive)
- `<leader>gl` - LazyGit (terminal UI)
- `<leader>gb` - Git blame
- `<leader>gc` - Git commit
- `<leader>gd` - Git diff / toggle deleted
- `<leader>gp` - Git push
- `<leader>hs` - Stage hunk
- `<leader>hr` - Reset hunk
- `<leader>hS` - Stage buffer
- `<leader>hp` - Preview hunk

## Code & LSP

- `<leader>cf` - Format buffer
- `<leader>cl` - Refresh diagnostics
- `gd` - Go to definition
- `gr` - Go to references
- `gR` - List references
- `K` - Show hover information
- `<leader>ca` - Code actions
- `<leader>rn` - Rename symbol

## Copilot

- `<leader>cp` - Copilot panel
- `<leader>cc` - Copilot chat
- `<leader>ce` - Explain code
- `<leader>ct` - Generate tests
- `<leader>cr` - Review code
- `<leader>cR` - Refactor code
- `<leader>ci` - Edit with instructions

## Diagnostics & Debug

- `<leader>dd` - Toggle Trouble
- `<leader>dw` - Workspace diagnostics
- `<leader>df` - Document diagnostics
- `<leader>dq` - Quickfix list
- `<leader>dl` - Location list
- `<leader>db` - Toggle breakpoint
- `<leader>dc` - Continue debugging
- `<leader>ds` - Step over
- `<leader>di` - Step into
- `<leader>do` - Step out

## Testing

- `<leader>tf` - Test file
- `<leader>tn` - Test nearest
- `<leader>ts` - Test suite
- `<leader>tl` - Test last
- `<leader>tv` - Test visit

## Terminal

- `<leader>xf` - Float terminal
- `<leader>xh` - Horizontal terminal
- `<leader>xv` - Vertical terminal
- `<C-\>` - Toggle terminal
- `<leader>rc` - Rails console

## Buffers

- `<leader>bn` - Next buffer
- `<leader>bp` - Previous buffer
- `<leader>bd` - Delete buffer
- `<Alt+,/.>` - Previous/next buffer
- `<Alt+1-9>` - Go to buffer by position

## UI Toggles

- `<leader>uu` - Toggle undotree
- `<leader>uh` - Clear search highlights
- `<leader>ub` - Toggle line blame
- `<leader>uf` - Toggle format on save
- `<C-d>/<C-u>` - Scroll with cursor centered

## Rails/Ruby

- `<leader>rd` - Debug nearest RSpec test
- `<leader>rD` - Debug file RSpec tests
- `<leader>rs` - Start Rails server
- `<leader>rc` - Rails console
- `<leader>rv` - Controller/View toggle
- `<leader>rV` - View Rails routes
- `<leader>rS` - View database schema

## Functional Languages

### Haskell
- `<leader>rg` - Toggle GHCi REPL for package  
- `<leader>hf` - Toggle GHCi REPL for current file
- `<leader>rh` - Type check in GHCi
- `<leader>lh` - Hoogle lookup

### Elm
- `<leader>rm` - Elm Make
- `<leader>rE` - Elm Test
- `<leader>re` - Elm REPL
- `<leader>rd` - Elm Error Detail

### Elixir
- `<leader>rm` - Run mix command
- `<leader>ri` - IEx console

## Sort/Swap

- `<leader>is` - Sort functions alphabetically
- `<leader>iS` - Sort treesitter nodes
- `<leader>s` - Sort selected lines (visual)

## Database

- `<leader>md` - Toggle Database UI

## Motion and Navigation

- `<leader>ma` - Add file to harpoon
- `<leader>mh` - Show harpoon menu
- `<leader>1-4` - Jump to harpoon file 1-4
