return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-telescope/telescope.nvim",  -- Ensure telescope loads first
        "akinsho/toggleterm.nvim",        -- Ensure terminal loads first
    },
    opts = {
        preset = "modern",
        spec = {
            -- Only define groups, let individual plugins define their own descriptions
            { "<leader>f", group = "Find (Telescope)" },
            { "<leader>l", group = "LSP" },
            { "<leader>c", group = "Copilot & AI" },
            { "<leader>cr", group = "Rails AI" },
            { "<leader>cg", group = "Git AI" },
            { "<leader>b", group = "Buffer" },
            { "<leader>w", group = "Window" },
            { "<leader>g", group = "Git" },
            { "<leader>M", group = "Multi-cursor" },
            { "<leader>a", group = "Tabs" },
            { "<leader>r", group = "Rails/Ruby" },
            { "<leader>i", group = "IEx/Elixir" },
            { "<leader>ix", group = "IEx Terminal" },
            { "<leader>m", group = "Motion/Harpoon" },
            { "<leader>d", group = "Debug/Diagnostics" },
            { "<leader>t", group = "Test" },
            { "<leader>x", group = "Terminal" },
            { "<leader>u", group = "UI" },
            { "<leader>n", group = "Next (Treesitter)" },
            { "<leader>p", group = "Previous (Treesitter)" },
            { "<leader>o", group = "Open/Toggle" },
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