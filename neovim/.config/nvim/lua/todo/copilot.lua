-- GitHub Copilot integration

return {
  -- Copilot (main plugin)
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = true,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>",
          },
          layout = {
            position = "bottom", -- | top | left | right
            ratio = 0.4,
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<M-l>",
            accept_word = "<M-k>",
            accept_line = "<M-j>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        filetypes = {
          yaml = false,
          markdown = true,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
        copilot_node_command = 'node', -- Node.js version used by Copilot
        server_opts_overrides = {},
      })
    end,
  },
  
  -- Copilot Chat (interactive AI assistance)
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    opts = {
      prompts = {
        Explain = {
          prompt = "Explain how the following code works.",
          mapping = "<leader>ce",
        },
        Review = {
          prompt = "Review the following code and provide suggestions for improvement.",
          mapping = "<leader>cr",
        },
        Tests = {
          prompt = "Generate unit tests for the following code.",
          mapping = "<leader>ct",
        },
        Refactor = {
          prompt = "Refactor the following code to improve its clarity and readability.",
          mapping = "<leader>cR",
        },
        FixError = {
          prompt = "Fix the following error in my code:",
          mapping = "<leader>cx",
        },
        Optimize = {
          prompt = "Optimize the following code for better performance:",
          mapping = "<leader>co",
        },
        Docs = {
          prompt = "Write documentation for the following code:",
          mapping = "<leader>cd",
        },
        -- Adding edit-specific prompts
        EditCode = {
          prompt = "Edit the following code based on my instructions:",
          mapping = "<leader>cie",
        },
        CompleteImplementation = {
          prompt = "Complete the implementation of the following code:",
          mapping = "<leader>cic",
        },
        FixBugs = {
          prompt = "Find and fix bugs in the following code:",
          mapping = "<leader>cib",
        },
      },
      -- Enable edit mode and configure it
      edit_mode = {
        enabled = true,       -- Enable edit mode
        auto_apply = false,   -- Don't apply edits automatically
        instruction_format = "Edit the code to %s.",
        quiet = false,        -- Show UI when applying edits
        accept = "<leader>cy",  -- Key to accept edit
        reject = "<leader>cn",  -- Key to reject edit
      },
    },
    config = function(_, opts)
      local chat = require("CopilotChat")
      chat.setup(opts)
      
      -- Setup keybindings for CopilotChat
      vim.api.nvim_create_user_command("CopilotChatVisual", function(args)
        chat.ask(args.args, { selection = "visual" })
      end, { nargs = "*", range = true })

      -- Setup edit-specific commands
      vim.api.nvim_create_user_command("CopilotChatEdit", function(args)
        local instructions = args.args
        chat.edit(instructions)
      end, { nargs = "*", desc = "Edit code with Copilot instructions" })
      
      vim.api.nvim_create_user_command("CopilotChatEditBuffer", function(args)
        local instructions = args.args
        chat.edit_buffer(instructions)
      end, { nargs = "*", desc = "Edit entire buffer with Copilot instructions" })
      
      -- General prompt in normal mode
      vim.keymap.set("n", "<leader>cc", function()
        chat.toggle()
      end, { desc = "CopilotChat - Toggle" })
      
      -- Quick chat in visual mode
      vim.keymap.set("v", "<leader>cc", ":CopilotChatVisual<CR>", { desc = "CopilotChat - Ask about selection" })
      
      -- Edit mode shortcut (with visual selection)
      vim.keymap.set("v", "<leader>ce", function()
        vim.ui.input({ prompt = "Edit instructions: " }, function(instructions)
          if instructions then
            chat.edit(instructions)
          end
        end)
      end, { desc = "CopilotChat - Edit selected code" })
      
      -- Edit mode for buffer
      vim.keymap.set("n", "<leader>cE", function()
        vim.ui.input({ prompt = "Edit buffer instructions: " }, function(instructions)
          if instructions then
            chat.edit_buffer(instructions)
          end
        end)
      end, { desc = "CopilotChat - Edit entire buffer" })
      
      -- Show help
      vim.keymap.set("n", "<leader>ch", function()
        chat.help()
      end, { desc = "CopilotChat - Help" })
    end,
  },
}
