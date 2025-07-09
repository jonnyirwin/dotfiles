return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "hrsh7th/nvim-cmp", -- Optional: For slash command completion
    "nvim-telescope/telescope.nvim", -- Optional: For file selection
  },
  config = function()
    require("codecompanion").setup({
      -- Use your existing Copilot account
      strategies = {
        chat = {
          adapter = "copilot",
        },
        inline = {
          adapter = "copilot",
        },
        agent = {
          adapter = "copilot",
        },
      },
      
      -- Enhanced Rails-specific prompts
      prompt_library = {
        ["Rails Best Practices"] = {
          strategy = "chat",
          description = "Review code for Rails best practices",
          opts = {
            index = 1,
            is_slash_cmd = true,
            auto_submit = true,
            short_name = "rails",
          },
          prompts = {
            {
              role = "system",
              content = "You are a Rails expert. Review the provided code and suggest improvements following Rails conventions and best practices. Focus on security, performance, and maintainability.",
            },
            {
              role = "user",
              content = "Please review this code and suggest Rails best practices improvements:\n\n{{selection}}",
            },
          },
        },
        ["Rails Migration"] = {
          strategy = "chat",
          description = "Generate Rails migration",
          opts = {
            index = 2,
            is_slash_cmd = true,
            short_name = "migrate",
          },
          prompts = {
            {
              role = "user",
              content = "Generate a Rails migration for: {{input}}",
            },
          },
        },
        ["Rails Test"] = {
          strategy = "chat",
          description = "Generate Rails tests",
          opts = {
            index = 3,
            is_slash_cmd = true,
            short_name = "test",
          },
          prompts = {
            {
              role = "user",
              content = "Generate comprehensive RSpec tests for this Rails code:\n\n{{selection}}",
            },
          },
        },
        ["Rails Refactor"] = {
          strategy = "inline",
          description = "Refactor Rails code",
          opts = {
            index = 4,
            is_slash_cmd = true,
            short_name = "refactor",
          },
          prompts = {
            {
              role = "user",
              content = "Refactor this Rails code to be more efficient and follow Rails conventions:\n\n{{selection}}",
            },
          },
        },
      },
      
      -- Display options
      display = {
        action_palette = {
          width = 95,
          height = 10,
        },
        chat = {
          window = {
            layout = "vertical", -- or "horizontal", "float"
            width = 0.45,
            height = 0.8,
            relative = "editor",
            border = "rounded",
            title = "CodeCompanion Chat",
            footer = nil,
          },
          show_header = true,
          show_token_count = true,
        },
      },
      
      -- Keybindings
      keymaps = {
        -- Chat buffer keybindings
        chat = {
          close = {
            modes = { n = "q", i = "<C-c>" },
            index = 1,
            callback = "keymaps.close",
            description = "Close Chat",
          },
          stop = {
            modes = { n = "<C-c>" },
            index = 2,
            callback = "keymaps.stop",
            description = "Stop Request",
          },
          regenerate = {
            modes = { n = "gr" },
            index = 3,
            callback = "keymaps.regenerate",
            description = "Regenerate Last Response",
          },
          complete = {
            modes = { i = "<Tab>" },
            index = 4,
            callback = "keymaps.complete",
            description = "Complete",
          },
        },
        -- Inline keybindings
        inline = {
          accept = {
            modes = { n = "<C-y>" },
            index = 1,
            callback = "keymaps.accept",
            description = "Accept Inline Suggestion",
          },
          reject = {
            modes = { n = "<C-n>" },
            index = 2,
            callback = "keymaps.reject",
            description = "Reject Inline Suggestion",
          },
        },
      },
      
      -- Logging
      log_level = "INFO",
      
      -- Additional Rails-specific settings
      opts = {
        -- Send code context automatically
        send_code = true,
        -- Include file references in conversations
        use_default_actions = true,
        -- Enable system messages
        system_prompt = "You are an expert Rails developer. Provide code that follows Rails conventions and best practices.",
      },
    })
  end,
}
