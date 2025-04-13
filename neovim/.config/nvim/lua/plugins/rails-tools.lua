return {
  "weizheheng/ror.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  ft = { "ruby", "eruby", "haml", "slim" },
  config = function()
    require("ror").setup({
      test = {
        message = {
          -- Customize test running messages
          file = "Running tests for current file...",
          line = "Running test at current line..."
        }
      }
    })
    
    -- Updated keybindings to avoid conflicts with other Rails commands
    vim.keymap.set("n", "<leader>rV", ":RorRoutes<CR>", { desc = "Rails Routes View" })
    vim.keymap.set("n", "<leader>rS", ":RorSchemas<CR>", { desc = "Rails DB Schemas View" })
    -- Standardize on <leader>rv for Controller/View toggle (prioritize Rails over Haskell)
    vim.keymap.set("n", "<leader>rv", ":RorControllerToViewToggle<CR>", { desc = "Controller/View Toggle" })
  end
}
