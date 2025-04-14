-- Treesitter configuration

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function() 
      require('nvim-treesitter.configs').setup({
        -- A list of parser names, or "all"
        ensure_installed = {
          "lua", 
          "vim",
          "vimdoc",
          "javascript",
          "typescript", 
          "tsx",           -- For TypeScript React
          "ruby",          -- Added Ruby
          "c_sharp",       -- Added C#
          "python",
          "html",
          "css",
          "json",
          "markdown",
          "bash",
          "yaml",
          "embedded_template", -- For ERB files
          "haml",          -- Added HAML support
        },
      
        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,
        
        -- Automatically install missing parsers when entering buffer
        auto_install = true,
      
        highlight = {
          -- `false` will disable the whole extension
          enable = true,
          
          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          additional_vim_regex_highlighting = false,
        },
        
        indent = { enable = true },
        
        -- Enable incremental selection
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<CR>',
            scope_incremental = '<CR>',
            node_incremental = '<TAB>',
            node_decremental = '<S-TAB>',
          },
        },
        
        -- Text objects
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
              ["aa"] = "@parameter.outer",
              ["ia"] = "@parameter.inner",
              ["al"] = "@loop.outer",
              ["il"] = "@loop.inner",
              ["ai"] = "@conditional.outer",
              ["ii"] = "@conditional.inner",
              ["ab"] = "@block.outer",
              ["ib"] = "@block.inner",
              ["as"] = "@statement.outer",
              ["is"] = "@statement.inner",
              ["aC"] = "@comment.outer",
              ["iC"] = "@comment.inner",
            },
            selection_modes = {
              ['@parameter.outer'] = 'v', -- charwise
              ['@function.outer'] = 'V', -- linewise
              ['@class.outer'] = '<c-v>', -- blockwise
            },
            include_surrounding_whitespace = true,
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              ["]f"] = "@function.outer",
              ["]c"] = "@class.outer",
              ["]a"] = "@parameter.inner",
              ["]l"] = "@loop.outer",
              ["]i"] = "@conditional.outer",
              ["]b"] = "@block.outer",
              ["]s"] = "@statement.outer",
            },
            goto_next_end = {
              ["]F"] = "@function.outer",
              ["]C"] = "@class.outer",
              ["]A"] = "@parameter.inner",
              ["]L"] = "@loop.outer",
              ["]I"] = "@conditional.outer",
              ["]B"] = "@block.outer",
              ["]S"] = "@statement.outer",
            },
            goto_previous_start = {
              ["[f"] = "@function.outer",
              ["[c"] = "@class.outer",
              ["[a"] = "@parameter.inner",
              ["[l"] = "@loop.outer",
              ["[i"] = "@conditional.outer",
              ["[b"] = "@block.outer",
              ["[s"] = "@statement.outer",
            },
            goto_previous_end = {
              ["[F"] = "@function.outer",
              ["[C"] = "@class.outer",
              ["[A"] = "@parameter.inner",
              ["[L"] = "@loop.outer",
              ["[I"] = "@conditional.outer",
              ["[B"] = "@block.outer",
              ["[S"] = "@statement.outer",
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ["<leader>a"] = "@parameter.inner",
            },
            swap_previous = {
              ["<leader>A"] = "@parameter.inner",
            },
          },
        },
      })
    end
  }
}
