-- Telescope configuration

return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")
      
      telescope.setup({
        defaults = {
          prompt_prefix = " ",
          selection_caret = " ",
          path_display = { "smart" },
          file_ignore_patterns = { ".git/", "node_modules/", "target/" },
        },
      })
      
      -- Keymaps
      local keymap = vim.keymap
      
      keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
      keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find text" })
      keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
      keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help" })
      keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Find recent files" })
      keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "Find current word" })
      keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Find diagnostics" })
      keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Find document symbols" })
    end
  }
}
