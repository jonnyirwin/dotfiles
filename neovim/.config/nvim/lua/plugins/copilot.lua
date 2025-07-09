-- codecompanion.nvim keybindings
-- The main plugin configuration is in codecompanion.lua
-- This file contains only the keybindings for consistency with other plugins

local function setup_codecompanion_keybindings()
    -- Main CodeCompanion keybindings
    vim.keymap.set("n", "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "Toggle CodeCompanion Chat" })
    vim.keymap.set("v", "<leader>cc", "<cmd>CodeCompanionChat Add<cr>", { desc = "Add selection to CodeCompanion Chat" })
    vim.keymap.set("n", "<leader>ca", "<cmd>CodeCompanionActions<cr>", { desc = "CodeCompanion Action Palette" })
    vim.keymap.set("v", "<leader>ca", "<cmd>CodeCompanionActions<cr>", { desc = "CodeCompanion Action Palette" })
    vim.keymap.set("n", "<leader>ci", "<cmd>CodeCompanion<cr>", { desc = "Inline CodeCompanion" })
    vim.keymap.set("v", "<leader>ci", "<cmd>CodeCompanion<cr>", { desc = "Inline CodeCompanion" })
    vim.keymap.set("n", "<leader>ce", "<cmd>CodeCompanionChat Add<cr>", { desc = "Add to CodeCompanion Chat" })
    
    -- Rails-specific AI shortcuts using codecompanion.nvim slash commands
    vim.keymap.set("v", "<leader>cr", function()
        vim.cmd("CodeCompanionChat Add")
        vim.defer_fn(function()
            vim.api.nvim_feedkeys("/rails", "n", false)
        end, 100)
    end, { desc = "Rails best practices review" })
    
    vim.keymap.set("v", "<leader>ct", function()
        vim.cmd("CodeCompanionChat Add")
        vim.defer_fn(function()
            vim.api.nvim_feedkeys("/test", "n", false)
        end, 100)
    end, { desc = "Generate Rails tests" })
    
    vim.keymap.set("v", "<leader>cf", function()
        vim.cmd("CodeCompanion")
        vim.defer_fn(function()
            vim.api.nvim_feedkeys("/refactor", "n", false)
        end, 100)
    end, { desc = "Refactor Rails code" })
    
    vim.keymap.set("n", "<leader>cm", function()
        vim.cmd("CodeCompanionChat")
        vim.defer_fn(function()
            vim.api.nvim_feedkeys("/migrate ", "n", false)
        end, 100)
    end, { desc = "Generate Rails migration" })
    
    -- Additional useful keybindings
    vim.keymap.set("n", "<leader>cs", "<cmd>CodeCompanionChat New<cr>", { desc = "New CodeCompanion Chat" })
    vim.keymap.set("n", "<leader>cl", "<cmd>CodeCompanionChat Load<cr>", { desc = "Load CodeCompanion Chat" })
end

-- Setup keybindings when this file is loaded
setup_codecompanion_keybindings()

-- Return empty table since this is just for keybindings
-- The actual codecompanion.nvim plugin is configured in codecompanion.lua
return {}
