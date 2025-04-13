-- Haskell-specific settings

-- Use spaces (standard is 2 spaces)
vim.bo.expandtab = true
vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2

-- Set text width (common Haskell style is 80 columns)
vim.bo.textwidth = 80
vim.wo.colorcolumn = "80"

-- Add Hoogle lookup keybinding
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>lh', '<cmd>lua vim.lsp.buf.execute_command({command = "haskell.execHoogle", arguments = {vim.fn.expand("<cword>")}})<CR>', { noremap = true, silent = true, desc = "Hoogle Lookup" })

-- Update keybinding to match the new namespace
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>hf', '<cmd>lua require("haskell-tools").repl.toggle(vim.api.nvim_buf_get_name(0))</cmd>', { noremap = true, silent = true, desc = "Toggle GHCi REPL (current file)" })

-- Make sure imports are properly indented
vim.opt_local.formatprg = "stylish-haskell"
