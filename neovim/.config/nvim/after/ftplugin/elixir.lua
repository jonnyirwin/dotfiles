-- Elixir-specific settings

-- Use spaces for Elixir (standard is 2 spaces)
vim.bo.expandtab = true
vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2

-- Note: Auto format on save is now handled by none-ls

-- Use vim-test for consistency instead of direct mix test command
vim.g["test#elixir#exunit#executable"] = "mix test"

-- Add vim-test keybindings to match the global test keybindings
vim.keymap.set("n", "<leader>tf", ":TestFile<CR>", { desc = "Test file", buffer = true })
vim.keymap.set("n", "<leader>tn", ":TestNearest<CR>", { desc = "Test nearest", buffer = true })
vim.keymap.set("n", "<leader>ts", ":TestSuite<CR>", { desc = "Test suite", buffer = true })
vim.keymap.set("n", "<leader>tl", ":TestLast<CR>", { desc = "Test last", buffer = true })

-- Remove the direct mix test keybinding since we'll use vim-test
-- vim.keymap.set("n", "<leader>tm", ":!mix test %<CR>", { desc = "Mix test current file", buffer = true })
