-- General Neovim settings

local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs & Indentation
opt.tabstop = 2       -- Width of tab character
opt.softtabstop = 2   -- Number of spaces inserted when hitting Tab
opt.shiftwidth = 2    -- Width of indents
opt.expandtab = false -- Use tabs instead of spaces
opt.smarttab = true   -- Be smart about using tabs
opt.autoindent = true
opt.smartindent = true

-- Line wrapping
opt.wrap = false

-- Search settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- Cursor line
opt.cursorline = true

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "auto:1"  -- Only show sign column when needed (prevents layout shift)

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Split windows
opt.splitright = true
opt.splitbelow = true

-- Consider dash as part of the word
opt.iskeyword:append("-")

-- Decrease update time
opt.updatetime = 50

-- Disable swap and backup files
opt.swapfile = false
opt.backup = false

-- Persistent undo
opt.undofile = true

-- Keep space from top and bottom while scrolling
opt.scrolloff = 8

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Define nicer diagnostic signs
local signs = {
  Error = " ",
  Warn = " ",
  Hint = " ",
  Info = " "
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
