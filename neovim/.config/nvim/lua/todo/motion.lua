-- Enhanced navigation plugins

return {
  -- Enhanced f/t motions
  {
    "ggandor/leap.nvim",
    dependencies = { "tpope/vim-repeat" },
    config = function()
      require('leap').add_default_mappings()
      -- Configure leap for better visibility
      require('leap').opts.highlight_unlabeled_phase_one_targets = true
      require('leap').opts.safe_labels = {}
    end
  },
  
  -- Harpoon for file navigation
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      
      -- Configuration
      harpoon:setup({
        settings = {
          save_on_toggle = true,
          sync_on_ui_close = true,
        }
      })
      
      -- Keymaps - Changed from h to m prefix for motion
      vim.keymap.set("n", "<leader>ma", function() harpoon:list():append() end, { desc = "Add file to harpoon" })
      vim.keymap.set("n", "<leader>mh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Show harpoon menu" })
      
      -- Navigation keymaps
      vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Harpoon 1" })
      vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Harpoon 2" })
      vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Harpoon 3" })
      vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Harpoon 4" })
      
      -- Telescope integration
      local conf = require("telescope.config").values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end
        
        require("telescope.pickers").new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
            results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
        }):find()
      end
      
      -- Add Telescope extension command
      vim.keymap.set("n", "<leader>fm", function() toggle_telescope(harpoon:list()) end, { desc = "Find harpoon files" })
      
      -- Which-key integration - Updated to use m prefix
      local wk = require("which-key")
      wk.register({
        ["<leader>m"] = {
          name = " Manage/Motion",
          a = { function() harpoon:list():append() end, "Add file to harpoon" },
          h = { function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, "Show harpoon menu" },
        },
        ["<leader>f"] = {
          m = { function() toggle_telescope(harpoon:list()) end, "Find harpoon files" },
        },
      })
    end,
  },
}
