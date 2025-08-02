local keymap = vim.keymap
keymap.set("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- === CORE NAVIGATION ===

-- Window management
keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>wh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>we", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>wx", ":close<CR>", { desc = "Close current split" })

-- Navigation between windows/tmux panes is handled by vim-tmux-navigator
-- The keybindings <C-h>, <C-j>, <C-k>, <C-l> work automatically

-- Tab management
keymap.set("n", "<leader>ao", ":tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>ax", ":tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>an", ":tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>ap", ":tabp<CR>", { desc = "Go to previous tab" })

-- Alternative Oil keybindings (main one is <leader>e in oil.lua)
keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory in oil" })
keymap.set("n", "<leader>eh", "<CMD>Oil --horizontal<CR>", { desc = "Oil horizontal split" })
keymap.set("n", "<leader>ev", "<CMD>Oil --vertical<CR>", { desc = "Oil vertical split" })

-- === BUFFER & NAVIGATION ===

-- Buffer navigation
keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })
keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })

-- === EDITING ENHANCEMENTS ===

-- Move lines in visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

-- Keep cursor centered when scrolling
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep cursor centered when searching
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- Better paste (don't lose clipboard content when pasting over selection)
keymap.set("x", "<leader>P", [["_dP]], { desc = "Paste without yanking" })

-- Copy to system clipboard
keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = "Copy to system clipboard" })
keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy line to system clipboard" })

-- Delete without yanking
keymap.set({"n", "v"}, "<leader>D", [["_d]], { desc = "Delete without yanking" })

-- Custom sort for visual selection
keymap.set("v", "<leader>s", ":sort<CR>", { desc = "Sort selected lines" })

-- Quick substitute for word under cursor
keymap.set("n", "<leader>S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Substitute word under cursor" })

-- Auto-save toggle
keymap.set("n", "<leader>ua", ":ASToggle<CR>", { desc = "Toggle auto-save" })

-- === UI TOGGLES ===

-- Clear search highlights
keymap.set("n", "<leader>uh", ":nohlsearch<CR>", { desc = "Clear search highlights" })

-- === RAILS/RUBY DEVELOPMENT ===

-- Rails keybindings
keymap.set("n", "<leader>rv", ":A<CR>", { desc = "Rails alternate file (controller/view toggle)" })
keymap.set("n", "<leader>rV", ":Eview<CR>", { desc = "View Rails routes" })
keymap.set("n", "<leader>rS", ":Eschema<CR>", { desc = "View database schema" })
keymap.set("n", "<leader>rm", ":Emodel<CR>", { desc = "Go to model" })
keymap.set("n", "<leader>rg", ":Emigration<CR>", { desc = "Go to migration" })
keymap.set("n", "<leader>rt", ":Rake<CR>", { desc = "Run Rake task" })

-- === LSP & FORMATTING ===

-- Formatting (moved from <leader>gf to proper LSP namespace)
keymap.set("n", "<leader>lf", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "Format buffer" })

-- Diagnostics
keymap.set("n", "<leader>lR", function()
  vim.diagnostic.enable()
end, { desc = "Refresh diagnostics" })

-- === DATABASE ===

-- Database UI keybinding
keymap.set("n", "<leader>md", ":DBUIToggle<CR>", { desc = "Toggle Database UI" })

-- === PLUGIN CONFIGURATIONS ===
-- Note: The following are configured in their respective plugin files:
-- - Telescope keybindings: lua/plugins/telescope.lua (<leader>f namespace)
-- - Test keybindings: lua/plugins/neotest.lua (<leader>t namespace) 
-- - DAP keybindings: lua/plugins/nvim-dap.lua (<leader>d namespace)
-- - Terminal keybindings: lua/plugins/terminal.lua (<leader>x namespace, <leader>rc, <leader>rs)
-- - Copilot keybindings: lua/plugins/copilot.lua (<leader>c namespace)
-- - Navigation keybindings: lua/plugins/navigation.lua (<leader>m namespace, <leader>1-4)
-- - Oil main keybinding: lua/plugins/oil.lua (<leader>e)
