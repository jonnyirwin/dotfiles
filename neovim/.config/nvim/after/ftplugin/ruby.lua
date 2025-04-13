-- Ruby-specific settings

-- Use spaces for Ruby (standard convention is 2 spaces)
vim.bo.expandtab = true
vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2

-- Set text width and color column for Ruby files
vim.bo.textwidth = 100       -- Set preferred text width
vim.wo.colorcolumn = "100"   -- Show a visual guide at column 100
