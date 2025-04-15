-- Support for functional programming languages

return {
  -- Haskell specific plugins
  {
    "mrcjkb/haskell-tools.nvim",
    version = "^3",
    ft = { "haskell", "lhaskell", "cabal" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local ht = require('haskell-tools')
      -- Setup with default values
      ht.setup {
        hls = {
          -- Set this to false if you don't want HLS to automatically setup hoogle
          setup_hoogle = true,
        },
        tools = {
          -- Automatically reload files changed outside of neovim
          repl = {
            handler = "toggleterm",
            auto_focus = true,
          },
          hover = {
            enable = true,
            border = "rounded",
            auto_focus = true,
          },
        }
      }
      
      -- Keymaps specific to Haskell buffers
      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'haskell' },
        callback = function()
          local opts = { buffer = true, silent = true }
          
          -- Toggle a GHCi repl for the current package
          vim.keymap.set('n', '<leader>rg', ht.repl.toggle, opts)
          -- Toggle a GHCi repl for the current buffer - moved to Haskell namespace
          vim.keymap.set('n', '<leader>hf', function()
            ht.repl.toggle(vim.api.nvim_buf_get_name(0))
          end, vim.tbl_extend('keep', { desc = "Toggle GHCi REPL (current file)" }, opts))
          -- Typecheck the current buffer
          vim.keymap.set('n', '<leader>rh', ht.repl.type_check,
            vim.tbl_extend('keep', { desc = "Type check in GHCi" }, opts))
        end,
      })
    end,
  },
  
  -- Elm specific plugins
  {
    "elmcast/elm-vim",
    ft = { "elm" },
    init = function()
      vim.g.elm_setup_keybindings = 0
      vim.g.elm_format_autosave = 1  -- This works with none-ls
    end,
    config = function()
      -- Elm specific keybindings
      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'elm' },
        callback = function()
          local opts = { buffer = true, silent = true }
          vim.keymap.set('n', '<leader>rm', ':ElmMake<CR>', 
            vim.tbl_extend('keep', { desc = "Elm Make" }, opts))
          vim.keymap.set('n', '<leader>rE', ':ElmTest<CR>',
            vim.tbl_extend('keep', { desc = "Elm Test" }, opts))
          vim.keymap.set('n', '<leader>re', ':ElmRepl<CR>', 
            vim.tbl_extend('keep', { desc = "Elm REPL" }, opts))
          vim.keymap.set('n', '<leader>rd', ':ElmErrorDetail<CR>', 
            vim.tbl_extend('keep', { desc = "Elm Error Detail" }, opts))
        end,
      })
    end
  },
  
  -- Elixir specific plugins
  {
    "elixir-editors/vim-elixir",
    ft = { "elixir", "eelixir", "heex" },
    config = function()
      -- Elixir specific keybindings
      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'elixir', 'eelixir', 'heex' },
        callback = function()
          local opts = { buffer = true, silent = true }
          vim.keymap.set('n', '<leader>rm', ':!mix<Space>', 
            vim.tbl_extend('keep', { desc = "Run mix command" }, opts))
          -- Note: Test commands moved to vim-test in global test namespace
          vim.keymap.set('n', '<leader>ri', ':terminal iex -S mix<CR>', 
            vim.tbl_extend('keep', { desc = "IEx console" }, opts))
        end,
      })
    end
  }
}
