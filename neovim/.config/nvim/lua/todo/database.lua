return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    "tpope/vim-dadbod",
    "kristijanhusak/vim-dadbod-completion",
  },
  cmd = {"DBUI", "DBUIToggle", "DBUIAddConnection"},
  config = function()
    -- Create a shortcut - Changed from <leader>db to <leader>md (manage database)
    vim.keymap.set("n", "<leader>md", ":DBUIToggle<CR>", { desc = "Toggle Database UI" })
    
    -- Add DB UI configurations
    vim.g.db_ui_save_location = vim.fn.stdpath("data") .. "/db_ui"
    vim.g.db_ui_use_nerd_fonts = 1
    
    -- Auto-completion
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {"sql", "mysql", "plsql"},
      callback = function()
        require("cmp").setup.buffer({ sources = {{ name = "vim-dadbod-completion" }} })
      end,
    })
    
    -- Register with which-key
    local wk = require("which-key")
    wk.register({
      ["<leader>m"] = {
        name = " Manage/Motion",
        d = { ":DBUIToggle<CR>", "Toggle Database UI" },
      }
    })
  end
}
