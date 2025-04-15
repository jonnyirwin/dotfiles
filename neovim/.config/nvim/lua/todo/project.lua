-- Project management and session handling

return {
  -- Project management
  {
    "ahmedkhalf/project.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("project_nvim").setup({
        -- Detection methods: lsp, pattern, or both
        detection_methods = { "lsp", "pattern" },
        -- Patterns to identify project root
        patterns = { ".git", "Gemfile", "package.json", "Makefile", ".gitignore", ".projectroot", "_darcs", ".hg", ".bzr", ".svn" },
        -- Automatically cd to project root when detected
        silent_chdir = true,
        -- Show project root path in statusline
        show_hidden = false,
        -- Set up Telescope integration
        datapath = vim.fn.stdpath("data"),
      })
      
      -- Add keybinding to find and switch projects
      vim.keymap.set("n", "<leader>pp", ":Telescope projects<CR>", { desc = "Find projects" })
      
      -- Enable Telescope projects extension
      require('telescope').load_extension('projects')
      
      -- Add which-key label
      require("which-key").register({
        ["<leader>p"] = {
          p = { ":Telescope projects<cr>", "Find projects" },
        }
      })
    end
  },
  
  -- Session management
  {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup({
        log_level = "error",
        auto_session_suppress_dirs = {"~/", "~/Downloads", "~/Documents"},
        auto_session_enabled = true,
        auto_save_enabled = true,
        auto_restore_enabled = true,
        auto_session_use_git_branch = true,
        
        -- Keymappings for session management
        post_restore_cmds = {"Oil"},
        pre_save_cmds = {},
      })
      
      -- Keymappings
      vim.keymap.set("n", "<leader>ps", ":SessionSave<CR>", { desc = "Save session" })
      vim.keymap.set("n", "<leader>pd", ":SessionDelete<CR>", { desc = "Delete session" })
      vim.keymap.set("n", "<leader>pr", ":SessionRestore<CR>", { desc = "Restore session" })
      
      -- Add which-key integration
      require("which-key").register({
        ["<leader>p"] = {
          s = { ":SessionSave<CR>", "Save session" },
          d = { ":SessionDelete<CR>", "Delete session" },
          r = { ":SessionRestore<CR>", "Restore session" },
        }
      })
    end
  }
}
