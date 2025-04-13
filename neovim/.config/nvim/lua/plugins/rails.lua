-- Ruby on Rails development plugins

return {
  -- HAML support
  {
    "tpope/vim-haml",
    ft = { "haml" },
    config = function()
      -- Set up HAML specific indentation
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "haml",
        callback = function()
          vim.bo.expandtab = true
          vim.bo.tabstop = 2
          vim.bo.shiftwidth = 2
          vim.bo.softtabstop = 2
        end,
      })
    end,
  },

  -- Rails integration
  {
    "tpope/vim-rails",
    ft = { "ruby", "eruby", "haml", "slim" },
    cmd = {
      "Emodel", "Eview", "Econtroller", "Ehelper", "Emailer", "Emigration",
      "Eserializer", "Ejob", "Espec", "Eschema", "Eroutes", "Rgenerate",
      "Rake", "Rserver", "Rconsole", "Dbmigrate"
    },
    dependencies = { "tpope/vim-dispatch", "tpope/vim-projectionist" },
    config = function()
      -- Add a keybinding for Rails commands
      vim.keymap.set("n", "<leader>r", ":Rails ", { desc = "Rails command" })
    end,
  },

  -- End-wise - automatically adds 'end' after 'if', 'do', 'def', etc.
  {
    "RRethy/nvim-treesitter-endwise",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = "InsertEnter",
    config = function()
      require("nvim-treesitter.configs").setup({
        endwise = {
          enable = true,
        },
      })
    end,
  },

  -- RSpec integration - Remove duplicate keybindings
  {
    "thoughtbot/vim-rspec",
    ft = { "ruby" },
    dependencies = { "tpope/vim-dispatch" },
    config = function()
      -- Configure RSpec command only (vim-test will handle keybindings)
      vim.g["rspec_command"] = "Dispatch bundle exec rspec {spec}"
      -- No keybindings here to avoid conflicts with vim-test
    end,
  },

  -- Test navigation - This will be the primary test runner
  {
    "vim-test/vim-test",
    dependencies = { "tpope/vim-dispatch" },
    cmd = { "TestFile", "TestNearest", "TestSuite", "TestLast", "TestVisit" },
    config = function()
      vim.g["test#strategy"] = "dispatch"
      vim.keymap.set("n", "<leader>tf", ":TestFile<CR>", { desc = "Test file" })
      vim.keymap.set("n", "<leader>tn", ":TestNearest<CR>", { desc = "Test nearest" })
      vim.keymap.set("n", "<leader>ts", ":TestSuite<CR>", { desc = "Test suite" })
      vim.keymap.set("n", "<leader>tl", ":TestLast<CR>", { desc = "Test last" })
      vim.keymap.set("n", "<leader>tv", ":TestVisit<CR>", { desc = "Test visit" })
    end,
  },

  -- Textobj-rubyblock - for selecting Ruby blocks (if/end, do/end, etc.)
  {
    "nelstrom/vim-textobj-rubyblock",
    dependencies = { "kana/vim-textobj-user" },
    ft = { "ruby", "eruby", "haml" },
  },

  -- Dispatch for running commands in the background
  { "tpope/vim-dispatch" },

  -- Projectionist for navigation between related files
  { "tpope/vim-projectionist" },

  -- Ruby syntax highlighting improvements
  {
    "vim-ruby/vim-ruby",
    ft = { "ruby", "eruby", "haml" },
  },

  -- ERB/EJS/JSX template improvements
  {
    "AndrewRadev/tagalong.vim",
    ft = { "html", "xml", "eruby", "haml", "jsx", "tsx" },
  },

  -- Surroundings (quotes, brackets, XML tags, etc.)
  {
    "tpope/vim-surround",
    event = "VeryLazy",
  },

  -- Git integration (already included but useful for Rails projects)
  { "tpope/vim-fugitive" },
}
