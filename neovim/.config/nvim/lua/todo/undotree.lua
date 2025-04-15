-- Undotree for visualizing and navigating undo history

return {
  "mbbill/undotree",
  cmd = "UndotreeToggle",
  config = function()
    vim.g.undotree_WindowLayout = 2
    vim.g.undotree_SplitWidth = 40
    vim.g.undotree_DiffpanelHeight = 10
    vim.g.undotree_SetFocusWhenToggle = 1
    vim.g.undotree_DiffAutoOpen = 1
    vim.g.undotree_ShortIndicators = 1
    
    -- Add keybinding (moved to u prefix)
    vim.keymap.set("n", "<leader>uu", ":UndotreeToggle<CR>", { desc = "Toggle Undotree" })
    
    -- Add which-key label (with updated UI toggles)
    require("which-key").register({
      ["<leader>u"] = {
        name = " UI Toggles",
        u = { ":UndotreeToggle<CR>", "Toggle Undotree" },
        h = { ":nohlsearch<CR>", "Clear search highlights" },
        b = { "<cmd>lua require('gitsigns').toggle_current_line_blame()<CR>", "Toggle line blame" },
        f = { "<cmd>lua vim.g.format_on_save = not (vim.g.format_on_save or false); vim.notify('Format on save ' .. (vim.g.format_on_save and 'enabled' or 'disabled'))<CR>", "Toggle format on save" },
      },
    })
  end
}
