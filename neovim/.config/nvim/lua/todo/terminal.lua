-- Terminal integration beyond tmux

return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = function(term)
          if term.direction == "horizontal" then
            return 15
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
          end
        end,
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "float", -- 'vertical', 'horizontal', 'tab', 'float'
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = "curved",
          winblend = 0,
          highlights = {
            border = "Normal",
            background = "Normal",
          },
        },
      })
      
      -- Custom terminal functions
      local Terminal = require("toggleterm.terminal").Terminal
      
      -- Lazygit terminal
      local lazygit = Terminal:new({ 
        cmd = "lazygit", 
        hidden = true,
        direction = "float",
        float_opts = {
          border = "double",
        },
      })
      
      function _G._LAZYGIT_TOGGLE()
        lazygit:toggle()
      end
      
      -- Rails console
      local rails_console = Terminal:new({ 
        cmd = "bundle exec rails console", 
        hidden = true,
        direction = "float",
      })
      
      function _G._RAILS_CONSOLE_TOGGLE()
        rails_console:toggle()
      end
      
      -- Keymappings (moved from t to x prefix)
      vim.keymap.set("n", "<leader>gl", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", { desc = "LazyGit" })
      vim.keymap.set("n", "<leader>rc", "<cmd>lua _RAILS_CONSOLE_TOGGLE()<CR>", { desc = "Rails Console" })
      vim.keymap.set("n", "<leader>xf", "<cmd>ToggleTerm direction=float<CR>", { desc = "Float terminal" })
      vim.keymap.set("n", "<leader>xh", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "Horizontal terminal" })
      vim.keymap.set("n", "<leader>xv", "<cmd>ToggleTerm direction=vertical<CR>", { desc = "Vertical terminal" })
      
      -- Add mappings for terminal mode
      function _G.set_terminal_keymaps()
        local opts = {buffer = 0}
        vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
        vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
        vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
      end
      
      -- Auto-command to set terminal keymaps when terminal opens
      vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
      
      -- Which-key integration
      require("which-key").register({
        ["<leader>x"] = {
          name = " Terminal",
          f = { "<cmd>ToggleTerm direction=float<CR>", "Float terminal" },
          h = { "<cmd>ToggleTerm direction=horizontal<CR>", "Horizontal terminal" },
          v = { "<cmd>ToggleTerm direction=vertical<CR>", "Vertical terminal" },
        },
      })
    end,
  }
}
