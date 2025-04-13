-- Core utility plugins and libraries

return {
  -- Core libraries
  { "nvim-lua/plenary.nvim" },
  { "nvim-tree/nvim-web-devicons" },
  
  -- Autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      local autopairs = require('nvim-autopairs')
      autopairs.setup({
        check_ts = true,
        ts_config = {
          lua = {'string'},
          javascript = {'template_string'},
        }
      })
      
      -- Make autopairs and completion work together if blink-cmp is available
      local ok, cmp_autopairs = pcall(require, 'nvim-autopairs.completion.cmp')
      if ok then
        local ok2, blink = pcall(require, 'blink-cmp')
        if ok2 and blink.event and blink.event.on then
          blink.event:on('confirm_done', cmp_autopairs.on_confirm_done())
        end
      end
    end
  },
  
  -- Comments
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
      require('Comment').setup()
    end
  },
  
  -- Filetype detection and settings
  { 
    "nathom/filetype.nvim",
    config = function()
      require("filetype").setup({
        overrides = {
          extensions = {
            -- Force languages that should use spaces
            py = { filetype = "python", expandtab = true },
            yaml = { filetype = "yaml", expandtab = true },
            yml = { filetype = "yaml", expandtab = true },
            json = { filetype = "json", expandtab = true },
            rb = { filetype = "ruby", expandtab = true },
            cs = { filetype = "cs", expandtab = true },
            ts = { filetype = "typescript", expandtab = true },
            tsx = { filetype = "typescriptreact", expandtab = true },
            -- Functional languages
            hs = { filetype = "haskell", expandtab = true },
            elm = { filetype = "elm", expandtab = true },
            ex = { filetype = "elixir", expandtab = true },
            exs = { filetype = "elixir", expandtab = true },
          },
        },
      })
    end
  },
  
  -- Seamless navigation between tmux panes and vim splits
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
    },
    keys = {
      { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Navigate window left" },
      { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Navigate window down" },
      { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Navigate window up" },
      { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Navigate window right" },
    },
  },
}
