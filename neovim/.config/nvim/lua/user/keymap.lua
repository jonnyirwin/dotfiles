-- Key mappings

local keymap = vim.keymap

-- General keymaps
-- Oil.nvim with different window modes
keymap.set("n", "<leader>pv", "<CMD>Oil<CR>", { desc = "Open oil file explorer" })
keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory in oil" })
keymap.set("n", "<leader>pf", "<CMD>Oil --float<CR>", { desc = "Open oil in float window" })
keymap.set("n", "<leader>os", "<CMD>Oil --horizontal<CR>", { desc = "Open oil in horizontal split" })
keymap.set("n", "<leader>o|", "<CMD>Oil --vertical<CR>", { desc = "Open oil in vertical split" })

-- Window management (changed from s to w prefix)
keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>wh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>we", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>wx", ":close<CR>", { desc = "Close current split" })

-- Navigation between windows/tmux panes is now handled by vim-tmux-navigator
-- The keybindings <C-h>, <C-j>, <C-k>, <C-l> will work automatically

-- Tab management (changed from t to a prefix)
keymap.set("n", "<leader>ao", ":tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>ax", ":tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>an", ":tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>ap", ":tabp<CR>", { desc = "Go to previous tab" })

-- Move lines in visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

-- Keep cursor centered when scrolling
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep cursor centered when searching
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- Clear search highlights
keymap.set("n", "<leader>uh", ":nohlsearch<CR>", { desc = "Clear search highlights" })

-- Buffer navigation
keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })
keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })

-- Formatting/Linting
keymap.set("n", "<leader>cf", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "Format buffer" })

keymap.set("n", "<leader>cl", function()
  -- This will trigger all diagnostics, including those from none-ls
  vim.diagnostic.enable()
end, { desc = "Refresh diagnostics" })

-- Copilot (reorganized)
keymap.set("n", "<leader>cp", ":Copilot panel<CR>", { desc = "Copilot panel" })
keymap.set("n", "<leader>ce", function() require("CopilotChat").explain() end, { desc = "Copilot explain code" })
keymap.set("n", "<leader>ct", function() require("CopilotChat").tests() end, { desc = "Copilot generate tests" })
keymap.set("n", "<leader>cr", function() require("CopilotChat").review() end, { desc = "Copilot review code" })
keymap.set("n", "<leader>cR", function() require("CopilotChat").refactor() end, { desc = "Copilot refactor code" })

-- Copilot edit mode keymaps
keymap.set("v", "<leader>ci", function()
  vim.ui.input({ prompt = "Edit instructions: " }, function(instructions)
    if instructions then
      require("CopilotChat").edit(instructions)
    end
  end)
end, { desc = "Copilot edit selection" })

keymap.set("n", "<leader>ci", function()
  vim.ui.input({ prompt = "Edit buffer instructions: " }, function(instructions)
    if instructions then
      require("CopilotChat").edit_buffer(instructions)
    end
  end)
end, { desc = "Copilot edit buffer" })

-- Node sorting and manipulation
keymap.set("n", "<leader>is", function()
  require('iswap').sort_nodes("function.outer")
end, { desc = "Sort functions alphabetically" })

keymap.set("n", "<leader>iS", function()
  require('iswap').sort_nodes()
end, { desc = "Sort treesitter nodes" })

-- Custom sort for visual selection
keymap.set("v", "<leader>s", ":sort<CR>", { desc = "Sort selected lines" })

-- Add a Language namespace section for general language-specific commands
keymap.set("n", "<leader>l", function()
  require("lint").try_lint()
end, { desc = "Trigger linting" })
