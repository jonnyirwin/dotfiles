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
        ["Workspace Analysis"] = {
          strategy = "chat",
          description = "Analyze entire Rails workspace structure",
          opts = {
            index = 5,
            is_slash_cmd = true,
            short_name = "workspace",
          },
          prompts = {
            {
              role = "system",
              content = "You are a Rails expert analyzing a complete Rails application. Review the project structure, identify patterns, suggest improvements, and understand the overall architecture.",
            },
            {
              role = "user",
              content = "Please analyze this Rails project structure. Here's the current working directory and key files:\n\nProject Root: {{cwd}}\nCurrent File: {{filename}}\n\nPlease examine the overall architecture and suggest improvements.",
            },
          },
        },
        ["File Explorer"] = {
          strategy = "chat", 
          description = "Explore and understand project files",
          opts = {
            index = 6,
            is_slash_cmd = true,
            short_name = "explore",
          },
          prompts = {
            {
              role = "user",
              content = "Help me explore this Rails project. What files should I examine for: {{input}}",
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
        -- Enable workspace awareness for agents
        auto_insert_mode = true,
        send_buffer = true,
      },
      
      -- Enhanced workspace context for agents
      workspace = {
        auto_include_workspace_context = true,
        max_context_files = 10,
        context_patterns = {
          "*.rb",
          "*.erb", 
          "Gemfile",
          "config/routes.rb",
          "config/application.rb",
          "db/schema.rb",
          "spec/**/*.rb",
          "test/**/*.rb",
        },
      },
      
      -- Enable tools for better agent file access
      tools = {
        opts = {
          default_tools = {
            "file_search",
            "read_file", 
            "grep_search",
            "get_changed_files",
          },
        },
      },
      
      -- More autonomous agent configurations
      agents = {
        -- Enable auto-tool mode for smoother experience
        auto_tool_mode = false, -- Can be toggled with 'gta' in chat
        -- Make agents more proactive
        system_prompts = {
          autonomous_rails_dev = [[You are an autonomous Rails development agent. You have access to powerful tools:
          
- @file_search - Use this to find files when you need to understand project structure
- @read_file - Use this to examine specific files when you need their content  
- @grep_search - Use this to search for patterns across the codebase
- @create_file - Use this to create new files (controllers, models, views, etc.)
- @insert_edit_into_file - Use this to edit existing files
- @get_changed_files - Use this to see recent changes

IMPORTANT: You should proactively use these tools when they would help answer questions or complete tasks. Don't wait for explicit instructions to use tools - use your judgment about when file access, creation, or editing would be beneficial.

For Rails development:
1. When asked about code, use @grep_search or @file_search to find relevant files first
2. Use @read_file to understand current implementations
3. Create new files with @create_file when building features
4. Edit existing files with @insert_edit_into_file when modifying code

Be proactive and autonomous in using these tools to provide the best assistance.]],
        },
      },
    })
  end,
}
