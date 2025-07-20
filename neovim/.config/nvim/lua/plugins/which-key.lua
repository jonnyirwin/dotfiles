return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        delay = 500,
        spec = {
            { "<leader>f", group = "Find (Telescope)" },
            { "<leader>ff", desc = "Find files" },
            { "<leader>fg", desc = "Find text (grep)" },
            { "<leader>fb", desc = "Find buffers" },
            { "<leader>fh", desc = "Find help" },
            { "<leader>fa", desc = "Find all files (ignore gitignore)" },
            { "<leader>fd", desc = "Find files in current directory" },

            { "<leader>l", group = "LSP" },
            { "<leader>lf", desc = "Format buffer" },
            { "<leader>lD", desc = "Go to declaration" },
            { "<leader>ld", desc = "Go to definition" },
            { "<leader>lh", desc = "Show hover" },
            { "<leader>li", desc = "Go to implementation" },
            { "<leader>ls", desc = "Show signature help" },
            { "<leader>lr", desc = "Show references" },
            { "<leader>lc", desc = "Rename symbol" },
            { "<leader>la", desc = "Code actions" },
            { "<leader>lj", desc = "Next diagnostic" },
            { "<leader>lk", desc = "Previous diagnostic" },

            { "<leader>c", group = " Copilot & AI" },
            { "<leader>cc", desc = " Toggle Copilot Chat" },
            { "<leader>cr", desc = " Reset Chat" },
            { "<leader>cq", desc = " Close Chat" },
            { "<leader>cs", desc = " Copilot Setup" },
            { "<leader>c?", desc = " Copilot Status" },
            { "<leader>cp", desc = " Copilot Panel" },
            { "<leader>cE", desc = " Enable Copilot" },
            { "<leader>cD", desc = " Disable Copilot" },
            { "<leader>cm", desc = " Select Model" },
            { "<leader>ca", desc = " Select Agent" },
            { "<leader>ci", desc = " Fix Diagnostic Issue" },
            
            -- Selection-based commands (visual mode)
            { "<leader>ce", desc = " Explain Selection", mode = "v" },
            { "<leader>cf", desc = " Fix Selection", mode = "v" },
            { "<leader>co", desc = " Optimize Selection", mode = "v" },
            { "<leader>cd", desc = " Add Documentation", mode = "v" },
            { "<leader>ct", desc = " Generate Tests", mode = "v" },
            { "<leader>cR", desc = " Code Review", mode = "v" },
            { "<leader>cA", desc = " API Design Review", mode = "v" },
            { "<leader>cac", desc = " Accessibility Review", mode = "v" },
            { "<leader>cdb", desc = " Database Optimization", mode = "v" },
            
            -- Rails-specific commands
            { "<leader>cr", group = " Rails AI" },
            { "<leader>cre", desc = " Rails Explanation", mode = "v" },
            { "<leader>cro", desc = " Rails Optimization", mode = "v" },
            { "<leader>crt", desc = " Rails RSpec Tests", mode = "v" },
            { "<leader>crs", desc = " Rails Security Review", mode = "v" },
            { "<leader>crr", desc = " Rails Refactoring", mode = "v" },
            
            -- Git integration
            { "<leader>cg", group = " Git AI" },
            { "<leader>cgc", desc = " Generate Commit Message" },
            { "<leader>cgs", desc = "  Generate Commit Message (Staged)" },
            
            -- Rails-specific (visual mode)
            { "<leader>cr", group = "  Rails AI", mode = "v" },
            { "<leader>cre", desc = "  Rails Explain", mode = "v" },
            { "<leader>cro", desc = "⚡ Rails Optimize", mode = "v" },
            { "<leader>crt", desc = "  Rails Test", mode = "v" },
            
            -- Quick actions (visual mode)
            { "<leader>ce", desc = "  Explain Code", mode = "v" },
            { "<leader>cf", desc = "  Fix Code", mode = "v" },
            { "<leader>co", desc = "⚡ Optimize Code", mode = "v" },
            { "<leader>cd", desc = "  Add Documentation", mode = "v" },
            { "<leader>ct", desc = "  Generate Tests", mode = "v" },
            { "<leader>cv", desc = "  Review Code", mode = "v" },

            { "<leader>b", group = "Buffer" },
            { "<leader>bn", desc = "Next buffer" },
            { "<leader>bp", desc = "Previous buffer" },
            { "<leader>bd", desc = "Delete buffer" },

            { "<leader>w", group = "Window" },
            { "<leader>wv", desc = "Split vertically" },
            { "<leader>wh", desc = "Split horizontally" },
            { "<leader>we", desc = "Equalize splits" },
            { "<leader>wx", desc = "Close split" },

            { "<leader>a", group = "Tabs" },
            { "<leader>ao", desc = "Open new tab" },
            { "<leader>ax", desc = "Close tab" },
            { "<leader>an", desc = "Next tab" },
            { "<leader>ap", desc = "Previous tab" },

            { "<leader>r", group = "Rails/Ruby" },
            { "<leader>rv", desc = "Controller/View toggle" },
            { "<leader>rV", desc = "View Rails routes" },
            { "<leader>rS", desc = "View database schema" },
            { "<leader>rm", desc = "Go to model" },
            { "<leader>rg", desc = "Go to migration" },
            { "<leader>rt", desc = "Run Rake task" },
            { "<leader>rc", desc = "Rails console" },
            { "<leader>rs", desc = "Rails server" },
            { "<leader>rd", desc = "Debug nearest RSpec test" },
            { "<leader>rD", desc = "Debug RSpec file" },

            { "<leader>d", group = "Debug/Diagnostics" },
            { "<leader>db", desc = "Toggle breakpoint" },
            { "<leader>dB", desc = "Conditional breakpoint" },
            { "<leader>dc", desc = "Continue debugging" },
            { "<leader>ds", desc = "Step over" },
            { "<leader>di", desc = "Step into" },
            { "<leader>do", desc = "Step out" },
            { "<leader>dt", desc = "Terminate debugging" },
            { "<leader>du", desc = "Toggle debug UI" },
            { "<leader>dl", desc = "Run last debug session" },
            { "<leader>dr", desc = "Open debug REPL" },

            { "<leader>t", group = "Test" },
            { "<leader>tf", desc = "Test file" },
            { "<leader>tn", desc = "Test nearest" },
            { "<leader>ts", desc = "Test suite" },
            { "<leader>tl", desc = "Test last" },
            { "<leader>tv", desc = "Test output panel" },
            { "<leader>tS", desc = "Test summary" },
            { "<leader>to", desc = "Test output" },

            { "<leader>x", group = "Terminal" },
            { "<leader>xf", desc = "Float terminal" },
            { "<leader>xh", desc = "Horizontal terminal" },
            { "<leader>xv", desc = "Vertical terminal" },

            { "<leader>e", desc = "Open Oil (float)" },
            { "<leader>eh", desc = "Oil horizontal split" },
            { "<leader>ev", desc = "Oil vertical split" },
            { "-", desc = "Oil parent directory" },

            { "<leader>m", group = "Motion/Harpoon" },
            { "<leader>ma", desc = "Add to harpoon" },
            { "<leader>mh", desc = "Show harpoon menu" },
            { "<leader>md", desc = "Toggle Database UI" },
            { "<leader>1", desc = "Jump to harpoon 1" },
            { "<leader>2", desc = "Jump to harpoon 2" },
            { "<leader>3", desc = "Jump to harpoon 3" },
            { "<leader>4", desc = "Jump to harpoon 4" },

            { "<leader>u", group = "UI Toggles" },
            { "<leader>uh", desc = "Clear search highlights" },

            { "<leader>n", group = "Next (Treesitter)" },
            { "<leader>na", desc = "Swap parameter with next" },
            { "<leader>nf", desc = "Swap function with next" },

            { "<leader>p", group = "Previous (Treesitter)" },
            { "<leader>pa", desc = "Swap parameter with previous" },
            { "<leader>pf", desc = "Swap function with previous" },

            { "<leader>o", group = "Open/Toggle" },

            { "zR", desc = "Open all folds" },
            { "zM", desc = "Close all folds" },
            { "zr", desc = "Open folds except kinds" },
            { "zm", desc = "Close folds with" },
            { "zp", desc = "Peek fold or hover" },
            { "zO", desc = "Close other folds, open current" },
            { "[z", desc = "Previous fold" },
            { "]z", desc = "Next fold" },

            { "<leader>s", desc = "Sort selected lines", mode = "v" },
            { "<leader>de", desc = "Evaluate selection", mode = "v" },
            { "<leader>cf", desc = "Refactor Rails code", mode = "v" },
            { "<leader>cr", desc = "Rails best practices review", mode = "v" },
            { "<leader>ct", desc = "Generate Rails tests", mode = "v" },
        },
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
}
