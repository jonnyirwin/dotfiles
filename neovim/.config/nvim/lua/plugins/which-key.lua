return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        icons = {
            breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
            separator = "➜", -- symbol used between a key and its label
            group = "+", -- symbol prepended to a group
        },
        window = {
            border = "rounded", -- none, single, double, shadow
        },
    },
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)
        
        -- Register group names based on actual configured keybindings
        wk.register({
            ["<leader>f"] = { name = "+Find (Telescope)" },  -- Configured in telescope.lua
            ["<leader>l"] = { name = "+LSP" },               -- Updated to match lsp.lua
            ["<leader>c"] = { name = "+Copilot" },           -- Configured in copilot.lua
            ["<leader>b"] = { name = "+Buffer" },            -- Active in keymap.lua
            ["<leader>w"] = { name = "+Window" },            -- For navigation
            ["<leader>u"] = { name = "+UI Toggles" },        -- Active for <leader>uh in keymap.lua
            ["<leader>x"] = { name = "+Trouble" },           -- Configured in trouble.lua
            ["<leader>d"] = { name = "+Debug/Diagnostics" }, -- From keymap.lua and possibly nvim-dap
            
            -- Individual keys
            ["<leader>e"] = { "<CMD>Oil --float<CR>", "Open Oil Explorer" }, -- From oil.lua
            ["<leader>gf"] = { function() vim.lsp.buf.format({ async = true }) end, "Format buffer" }, -- From keymap.lua
        })
        
        -- Add additional groups when you implement their keybindings
        -- Uncomment as you implement them:
        --
        -- ["<leader>g"] = { name = "+Git" },
        -- ["<leader>r"] = { name = "+Rails/Ruby" },
        -- ["<leader>t"] = { name = "+Test" },
        -- ["<leader>a"] = { name = "+Tabs" },
        -- ["<leader>i"] = { name = "+Swap/Sort" },
        -- ["<leader>h"] = { name = "+Hunks (Git)" },
        -- ["<leader>p"] = { name = "+Project/Files" },
        -- ["<leader>v"] = { name = "+Vimux" },
        -- ["<leader>m"] = { name = "+Manage/Motion" },
    end
}