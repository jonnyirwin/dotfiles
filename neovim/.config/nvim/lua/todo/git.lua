-- Git integration

return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup {
        signs = {
          add          = { text = '▎' },  -- Changed from │ to a solid block
          change       = { text = '▎' },  -- Changed from │ to a solid block
          delete       = { text = '' },  -- Changed from _ to a better icon
          topdelete    = { text = '' },  -- Changed from ‾ to a better icon
          changedelete = { text = '▎' },  -- Changed from ~ to a solid block
          untracked    = { text = '┆' },
        },
        signcolumn = true,
        numhl      = false,
        linehl     = false,
        word_diff  = false,
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
      
          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end
      
          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end, {expr=true})
      
          map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end, {expr=true})
      
          -- Actions
          map('n', '<leader>hs', gs.stage_hunk, { desc = "Stage hunk" })
          map('n', '<leader>hr', gs.reset_hunk, { desc = "Reset hunk" })
          map('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
          map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
          map('n', '<leader>hS', gs.stage_buffer, { desc = "Stage buffer" })
          map('n', '<leader>hu', gs.undo_stage_hunk, { desc = "Undo stage hunk" })
          map('n', '<leader>hR', gs.reset_buffer, { desc = "Reset buffer" })
          map('n', '<leader>hp', gs.preview_hunk, { desc = "Preview hunk" })
          map('n', '<leader>hb', function() gs.blame_line{full=true} end, { desc = "Blame line" })
          map('n', '<leader>ub', gs.toggle_current_line_blame, { desc = "Toggle line blame" })
          map('n', '<leader>hd', gs.diffthis, { desc = "Diff against index" })
          map('n', '<leader>hD', function() gs.diffthis('~') end, { desc = "Diff against last commit" })
          map('n', '<leader>gd', gs.toggle_deleted, { desc = "Toggle deleted" })
        end
      }
    end
  },
  
  -- Git commands
  {
    "tpope/vim-fugitive",
    cmd = {
      "Git", "Gstatus", "Gblame", "Gpush", "Gpull", "Gwrite", "Gcommit",
      "Gdiffsplit", "Gvdiffsplit", "Gedit", "Gsplit", "Gread", "Gbrowse"
    },
    dependencies = { "tpope/vim-rhubarb" }, -- GitHub integration
    config = function()
      -- Add which-key labels for Git commands
      local wk = require("which-key")
      wk.register({
        ["<leader>g"] = {
          name = "Git",
          g = { "<cmd>Git<cr>", "Status" },
          b = { "<cmd>Git blame<cr>", "Blame" },
          c = { "<cmd>Git commit<cr>", "Commit" },
          d = { "<cmd>Gdiffsplit<cr>", "Diff" },
          l = { "<cmd>Git log<cr>", "Log" },
          p = { "<cmd>Git push<cr>", "Push" },
          P = { "<cmd>Git pull<cr>", "Pull" },
          r = { "<cmd>Gread<cr>", "Read" },
          w = { "<cmd>Gwrite<cr>", "Write" },
          h = { "<cmd>0Gclog<cr>", "File history" },
          B = { "<cmd>GBrowse<cr>", "Browse" },
        }
      })
      
      -- Fugitive keymaps
      vim.keymap.set("n", "<leader>gg", ":Git<CR>", { desc = "Git status" })
      vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", { desc = "Git blame" })
      vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", { desc = "Git commit" })
      vim.keymap.set("n", "<leader>gd", ":Gdiffsplit<CR>", { desc = "Git diff" })
    end,
  }
}
