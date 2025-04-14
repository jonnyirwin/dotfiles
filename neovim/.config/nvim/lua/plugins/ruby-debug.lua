-- Ruby debugging setup

return {
  -- Support for running tests with debugger attached
  {
    "vim-test/vim-test",
    dependencies = { "preservim/vimux" },
    config = function()
      -- Use Vimux strategy to run in tmux pane
      vim.g["test#strategy"] = "vimux"
      
      -- Add debugging prefixes for tests
      vim.g["test#ruby#rspec#executable"] = "bundle exec rspec"
      vim.g["test#ruby#minitest#executable"] = "bundle exec rails test"
      
      -- Debug prefixes for RSpec
      vim.keymap.set("n", "<leader>rd", function()
        vim.g["test#ruby#rspec#executable"] = "bundle exec rspec --require pry"
        vim.cmd("TestNearest")
        -- Reset to normal after execution
        vim.g["test#ruby#rspec#executable"] = "bundle exec rspec"
      end, { desc = "Debug nearest RSpec test" })
      
      -- Key for debugging whole file
      vim.keymap.set("n", "<leader>rD", function()
        vim.g["test#ruby#rspec#executable"] = "bundle exec rspec --require pry"
        vim.cmd("TestFile")
        vim.g["test#ruby#rspec#executable"] = "bundle exec rspec"
      end, { desc = "Debug file RSpec tests" })
    end
  },
  
  -- Tmux integration for running code in split panes
  {
    "preservim/vimux",
    config = function()
      -- Vimux key mappings for Rails debugging
      vim.keymap.set("n", "<leader>vp", ":VimuxPromptCommand<CR>", { desc = "Prompt for command" })
      vim.keymap.set("n", "<leader>vl", ":VimuxRunLastCommand<CR>", { desc = "Run last command" })
      vim.keymap.set("n", "<leader>vi", ":VimuxInspectRunner<CR>", { desc = "Inspect runner" })
      vim.keymap.set("n", "<leader>vz", ":VimuxZoomRunner<CR>", { desc = "Zoom runner" })
      
      -- Rails commands - removing duplicate console binding
      vim.keymap.set("n", "<leader>rs", function()
        vim.fn.VimuxRunCommand("bundle exec rails server")
      end, { desc = "Start Rails server" }) 
    end
  },
  
  -- Visual debugging helpers
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("nvim-dap-virtual-text").setup()
    end
  },
  
  -- Ruby  snippets and highlighting
  {
    "BlakeWilliams/vim-pry",
    ft = { "ruby" },
    config = function()
      -- Add pry require snippet
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "ruby",
        callback = function()
          vim.cmd([[
          inoremap <buffer> ;pry require 'pry'; binding.pry<Esc>
          inoremap <buffer> ;dbg require 'debug'; debugger<Esc>
          ]])
        end,
      })
    end
  },
}
