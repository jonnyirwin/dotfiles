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
    
    -- Workspace-aware agent commands
    vim.keymap.set("n", "<leader>cw", function()
        require("codecompanion").chat({
            args = {
                args = "Please analyze this Rails project structure and current file context.",
            }
        })
    end, { desc = "CodeCompanion with workspace context" })
    
    vim.keymap.set("n", "<leader>cp", function()
        local current_file = vim.fn.expand('%:.')
        require("codecompanion").chat({
            args = {
                args = "I'm working in " .. current_file .. ". Please help me with this file.",
            }
        })
    end, { desc = "CodeCompanion with current file context" })
    
    -- Advanced workspace exploration
    vim.keymap.set("n", "<leader>cW", function()
        local cwd = vim.fn.getcwd()
        local current_file = vim.fn.expand('%:.')
        local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
        
        local context_text = string.format(
            "WORKSPACE CONTEXT:\nProject Root: %s\nGit Root: %s\nCurrent File: %s\nCurrent Directory: %s\n\nPlease analyze this Rails project structure and help me with:",
            cwd, git_root or "Not a git repo", current_file, vim.fn.expand('%:h')
        )
        
        require("codecompanion").chat({
            args = { args = context_text }
        })
    end, { desc = "Advanced workspace context analysis" })
    
    -- Multi-file context builder
    vim.keymap.set("n", "<leader>cM", function()
        local context_text = "MULTI-FILE ANALYSIS:\nI'm going to show you several related files. Please analyze them together.\n\nFile 1 (" .. vim.fn.expand('%:.') .. "):"
        require("codecompanion").chat({
            args = { args = context_text }
        })
    end, { desc = "Multi-file context builder" })
    
    -- Rails-specific workspace commands
    vim.keymap.set("n", "<leader>cR", function()
        local rails_files = {
            "config/routes.rb",
            "Gemfile",
            "config/application.rb",
            "db/schema.rb"
        }
        
        local existing_files = {}
        for _, file in ipairs(rails_files) do
            if vim.fn.filereadable(file) == 1 then
                table.insert(existing_files, file)
            end
        end
        
        local context_text = "RAILS PROJECT ANALYSIS:\nKey files to consider: " .. table.concat(existing_files, ", ") .. "\n\nCurrent focus: " .. vim.fn.expand('%:.') .. "\n\nWhat would you like to know about this Rails project?"
        
        require("codecompanion").chat({
            args = { args = context_text }
        })
    end, { desc = "Rails-specific workspace analysis" })
    
    -- Advanced workspace utilities
    vim.keymap.set("n", "<leader>cF", function()
        require('utils.workspace_context').pick_context_files()
    end, { desc = "Pick related files for context" })
    
    vim.keymap.set("n", "<leader>cA", function()
        require('utils.workspace_context').add_rails_context_files()
    end, { desc = "Auto-add Rails context files" })
    
    vim.keymap.set("n", "<leader>cX", function()
        local context = require('utils.workspace_context').format_context_for_ai()
        require("codecompanion").chat({
            args = { args = context }
        })
    end, { desc = "Full workspace context analysis" })
    
    -- VS Code-like @workspace command
    vim.keymap.set("n", "<leader>c@", function()
        vim.ui.input({ prompt = "Ask @workspace: " }, function(query)
            if query then
                local workspace_context = require('utils.workspace_context')
                local template = workspace_context.create_workspace_template()
                local suggestions = workspace_context.suggest_relevant_files(query)
                
                local full_text = template
                if #suggestions > 0 then
                    full_text = full_text .. "SUGGESTED FILES FOR YOUR QUERY:\n" .. table.concat(suggestions, "\n") .. "\n\n"
                end
                full_text = full_text .. "@workspace " .. query .. "\n\nPlease analyze the workspace and answer this question using the project context above."
                
                require("codecompanion").chat({
                    args = { args = full_text }
                })
            end
        end)
    end, { desc = "VS Code-like @workspace query" })
    
    -- Agent with explicit file access tools
    vim.keymap.set("n", "<leader>cT", function()
        require("codecompanion").chat({
            args = { args = "I'm a Rails developer agent with file access tools. I can use @file_search to find files, @read_file to examine code, @grep_search to explore the codebase, @create_file to make new files, and @insert_edit_into_file to edit existing files. How can I help you with your Rails project?" }
        })
    end, { desc = "Agent with File Tools" })
    
    -- Quick file creation agent
    vim.keymap.set("n", "<leader>cN", function()
        require("codecompanion").chat({
            args = { args = "I can create new files for you using the @{create_file} tool. What files would you like me to create for your Rails project?" }
        })
    end, { desc = "File creation agent" })
    
    -- Autonomous Rails agent (more intelligent)
    vim.keymap.set("n", "<leader>cA", function()
        local workspace_context = require('utils.workspace_context')
        local autonomous_template = workspace_context.create_autonomous_agent_template()
        
        require("codecompanion").chat({
            args = { args = autonomous_template .. "\n\nWhat would you like help with in your Rails project?" }
        })
    end, { desc = "Autonomous Rails agent" })
    
    -- Toggle auto-tool mode for less interruptions  
    vim.keymap.set("n", "<leader>cG", function()
        if vim.g.codecompanion_auto_tool_mode then
            vim.g.codecompanion_auto_tool_mode = nil
            vim.notify("Auto-tool mode DISABLED - tools will require approval", vim.log.levels.INFO)
        else
            vim.g.codecompanion_auto_tool_mode = true
            vim.notify("Auto-tool mode ENABLED - tools will run automatically", vim.log.levels.WARN)
        end
    end, { desc = "Toggle auto-tool mode" })
    
    -- Task-specific agents that are more directive
    vim.keymap.set("n", "<leader>cB", function()
        vim.ui.input({ prompt = "What feature do you want to build? " }, function(feature)
            if feature then
                local build_prompt = string.format([[I need to build: %s

Please follow this process:
1. First use @file_search to understand the current project structure
2. Use @read_file to examine relevant existing files
3. Use @create_file to create any new files needed (models, controllers, views, tests)
4. Use @insert_edit_into_file to modify existing files as needed

Start by using @file_search "*.rb" to see the current structure, then ask me any clarifying questions about the feature requirements.]], feature)
                
                require("codecompanion").chat({
                    args = { args = build_prompt }
                })
            end
        end)
    end, { desc = "Build feature agent" })
    
    vim.keymap.set("n", "<leader>cD", function()
        vim.ui.input({ prompt = "Describe the bug or issue: " }, function(issue)
            if issue then
                local debug_prompt = string.format([[I'm having this issue: %s

Please help me debug it by:
1. Using @get_changed_files to see recent changes
2. Using @grep_search to find relevant code
3. Using @read_file to examine the problematic files
4. Using @insert_edit_into_file to fix the issue

Start by using @get_changed_files to see what's been modified recently.]], issue)
                
                require("codecompanion").chat({
                    args = { args = debug_prompt }
                })
            end
        end)
    end, { desc = "Debug issue agent" })
    
    vim.keymap.set("n", "<leader>cR", function()
        local current_file = vim.fn.expand('%:.')
        if current_file == '' then
            vim.notify("Please open a file first", vim.log.levels.WARN)
            return
        end
        
        local refactor_prompt = string.format([[I want to refactor this file: %s

Please:
1. Use @read_file "%s" to examine the current code
2. Analyze the code for improvements (performance, readability, Rails conventions)
3. Use @insert_edit_into_file to make the improvements
4. Explain what changes you made and why

Start by reading the file now.]], current_file, current_file)
        
        require("codecompanion").chat({
            args = { args = refactor_prompt }
        })
    end, { desc = "Refactor current file" })
    
    -- Edit selected code with context
    vim.keymap.set("v", "<leader>cE", function()
        local start_pos = vim.fn.getpos("'<")
        local end_pos = vim.fn.getpos("'>")
        local lines = vim.api.nvim_buf_get_lines(0, start_pos[2]-1, end_pos[2], false)
        local content = table.concat(lines, "\n")
        local filename = vim.fn.expand('%:.')
        
        local edit_prompt = string.format([[Here's code from %s (lines %d-%d):

```ruby
%s
```

Please use @insert_edit_into_file to improve this code. Consider:
- Rails conventions and best practices
- Performance optimizations  
- Code readability and maintainability
- Security concerns

What changes should I make to this code?]], filename, start_pos[2], end_pos[2], content)
        
        require("codecompanion").chat({
            args = { args = edit_prompt }
        })
    end, { desc = "Edit selected code" })
end

-- Setup keybindings when this file is loaded
setup_codecompanion_keybindings()

-- Return empty table since this is just for keybindings
-- The actual codecompanion.nvim plugin is configured in codecompanion.lua
return {}
