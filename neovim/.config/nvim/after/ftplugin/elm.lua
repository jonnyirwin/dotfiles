-- Elm-specific settings

-- Elm uses 4 spaces by convention
vim.bo.expandtab = true
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4

-- Let files be reloaded when changed externally (elm-format changes files)
vim.opt_local.autoread = true

-- Note: Auto format on save is now handled by none-ls
