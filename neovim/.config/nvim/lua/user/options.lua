-- General Neovim settings


local opt = vim.opt
opt.number = true
opt.relativenumber = true

opt.tabstop = 2       -- Width of tab character
opt.softtabstop = 2   -- Number of spaces inserted when hitting Tab
opt.shiftwidth = 2    -- Width of indents
opt.expandtab = false -- Use tabs instead of spaces
opt.smarttab = true   -- Be smart about using tabs
opt.autoindent = true
opt.smartindent = true

opt.wrap = false

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start"

opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

opt.updatetime = 50

opt.swapfile = false
opt.backup = false

opt.undofile = true

opt.scrolloff = 8

vim.schedule(function()
	opt.clipboard = 'unnamedplus'
end)
