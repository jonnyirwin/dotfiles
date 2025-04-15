-- Main entry point for plugins - this gets loaded by lazy.setup("plugins")

-- This file should ONLY import other plugin modules
return {
  -- Import all plugin modules
  { import = "plugins.ui" },          -- UI elements (statusline, colorscheme)
  { import = "plugins.lsp" },         -- LSP configuration
  { import = "plugins.completion" },  -- Completion with blink-cmp
  { import = "plugins.treesitter" },  -- Syntax highlighting & text objects
  { import = "plugins.telescope" },   -- Fuzzy finder
  { import = "plugins.explorer" },    -- Oil file explorer
  { import = "plugins.git" },         -- Git integration
  { import = "plugins.format" },      -- Formatters and linters
  { import = "plugins.rails" },       -- Ruby on Rails specific plugins
  { import = "plugins.copilot" },     -- GitHub Copilot configuration
  { import = "plugins.none-ls" },     -- Diagnostics & formatting with LSP UI
  { import = "plugins.folding" },     -- Code folding with nvim-ufo
  { import = "plugins.which-key" },   -- Keybinding help popup
  { import = "plugins.marks" },       -- Enhanced marks
  { import = "plugins.bufferline" },  -- Buffer tabs with barbar
  { import = "plugins.undotree" },    -- Undo history visualization
  { import = "plugins.trouble" },     -- Diagnostics viewer
  { import = "plugins.project" },     -- Project/session management
  { import = "plugins.terminal" },    -- Terminal integration
  { import = "plugins.motion" },      -- Enhanced movement
  { import = "plugins.functional-langs" }, -- Functional language support
  { import = "plugins.utilities" },   -- Core utilities like plenary, autopairs, etc.
  { import = "plugins.database" },    -- Database integration
  { import = "plugins.debugging" },   -- Debugging tools and configurations
}
