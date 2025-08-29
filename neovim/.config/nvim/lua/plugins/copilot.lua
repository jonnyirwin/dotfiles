return {
  {
    -- Core Copilot plugin
    'github/copilot.vim',
    event = 'InsertEnter',
    config = function()
      -- Disable default Tab mapping to prevent conflicts with blink.cmp
      vim.g.copilot_no_tab_map = true
      
      -- Configure reasonable idle delay (default is 15ms, we use 100ms for less aggressive suggestions)
      vim.g.copilot_idle_delay = 100
      
      -- Don't hide suggestions during completion menu (works better with blink.cmp)
      vim.g.copilot_hide_during_completion = 0
      
      -- Set up keymaps that don't conflict with your existing setup
      local opts = { silent = true, expr = true, replace_keycodes = false }
      
      -- Accept suggestion with Leader+Enter (intuitive and clean)
      vim.keymap.set('i', '<leader><CR>', 'copilot#Accept("\\<CR>")', opts)
      
      -- Accept word with Ctrl-Right (intuitive forward word motion)
      vim.keymap.set('i', '<C-Right>', 'copilot#AcceptWord()', opts)
      
      -- Accept line with Ctrl-Shift-Right
      vim.keymap.set('i', '<C-S-Right>', 'copilot#AcceptLine()', opts)
      
      -- Navigate suggestions with Alt+[ and Alt+]
      vim.keymap.set('i', '<M-[>', '<Plug>(copilot-previous)', { silent = true })
      vim.keymap.set('i', '<M-]>', '<Plug>(copilot-next)', { silent = true })
      
      -- Dismiss suggestion with Escape (additional to default Ctrl-])
      vim.keymap.set('i', '<C-e>', '<Plug>(copilot-dismiss)', { silent = true })
      
      -- Manually trigger suggestions
      vim.keymap.set('i', '<C-\\>', '<Plug>(copilot-suggest)', { silent = true })
      
      -- Additional configuration for better UX
      vim.g.copilot_filetypes = {
        ['*'] = true,
        ['gitcommit'] = false,
        ['gitrebase'] = false,
        ['help'] = false,
        ['markdown'] = true,
        ['yaml'] = true,
        ['json'] = true,
      }
    end,
  },
  
  {
    -- Copilot Chat plugin
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'github/copilot.vim' },
      { 'nvim-lua/plenary.nvim', branch = "master" },
    },
    lazy = false,
    opts = {
      -- Enhanced headers with Nerd Font icons
      question_header = ' User ',
      answer_header = ' Copilot ',
      error_header = ' Error ',
      separator = '───────',
      
      -- Mappings for chat window
      mappings = {
        complete = {
          detail = 'Use @<Tab> or /<Tab> for options.',
          insert = '<Tab>',
        },
        close = {
          normal = 'q',
          insert = '<C-c>'
        },
        reset = {
          normal = '<C-r>',
          insert = '<C-r>'
        },
        submit_prompt = {
          normal = '<CR>',
          insert = '<C-s>'
        },
        accept_diff = {
          normal = '<C-y>',
          insert = '<C-y>'
        },
        yank_diff = {
          normal = 'gy',
        },
        show_diff = {
          normal = 'gd'
        },
        show_system_prompt = {
          normal = 'gp'
        },
        show_user_selection = {
          normal = 'gs'
        },
      },
      
      -- Window configuration
      window = {
        layout = 'vertical',    -- 'vertical', 'horizontal', 'float'
        width = 0.4,           -- fractional width of parent
        height = 0.6,          -- fractional height of parent
        -- Options for float layout
        row = nil,             -- row position of the window, default is centered
        col = nil,             -- column position of the window, default is centered
        relative = 'editor',   -- 'editor', 'win', 'cursor', 'mouse'
        border = 'rounded',    -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
        title = '   Copilot Chat ',
        footer = '  Press q to close  ⮀  ? for help ',
        zindex = 1,            -- determines if window is on top or below other floating windows
      },
      
      -- Custom prompts with beautiful icons and Rails focus
      prompts = {
        -- Enhanced default prompts with icons
        Explain = {
          prompt = "Please explain how this code works.",
          system_prompt = "You are a helpful coding tutor. Provide clear, step-by-step explanations.",
          description = " Code Explanation",
        },
        Review = {
          prompt = "Review this code for potential improvements, bugs, and best practices.",
          system_prompt = "You are an experienced code reviewer. Focus on code quality, security, and maintainability.",
          description = " Code Review",
        },
        Fix = {
          prompt = "There is a problem in this code. Rewrite the code to fix the issue.",
          system_prompt = "You are a debugging expert. Identify and fix issues while explaining the problems.",
          description = " Bug Fix",
        },
        Optimize = {
          prompt = "Optimize the selected code to improve performance and readability.",
          system_prompt = "You are a performance optimization expert. Focus on efficiency and clean code principles.",
          description = " Performance Optimization",
        },
        Docs = {
          prompt = "Please add documentation comment for the following code.",
          system_prompt = "You are a technical documentation expert. Create clear, comprehensive documentation.",
          description = " Documentation",
        },
        Tests = {
          prompt = "Please generate tests for this code.",
          system_prompt = "You are a testing expert. Create thorough, meaningful tests with good coverage.",
          description = " Test Generation",
        },
        
        -- Rails-specific prompts with Ruby icons
        RailsExplain = {
          prompt = "Explain this Ruby/Rails code, focusing on Rails conventions and patterns.",
          system_prompt = "You are a Ruby on Rails expert. Explain code with focus on Rails conventions, patterns, and best practices.",
          description = " Rails Code Explanation",
        },
        RailsOptimize = {
          prompt = "Optimize this Ruby/Rails code for performance and Rails best practices. Focus on N+1 queries, database optimization, and Rails performance patterns.",
          system_prompt = "You are a Ruby on Rails performance expert. Focus on ActiveRecord optimization, caching, and Rails-specific performance improvements.",
          description = " Rails Performance Optimization",
        },
        RailsTest = {
          prompt = "Generate RSpec tests for this Ruby/Rails code following Rails testing best practices.",
          system_prompt = "You are a Rails testing expert. Write comprehensive RSpec tests following Rails testing conventions, using factories, and testing Rails-specific behavior.",
          description = " Rails RSpec Tests",
        },
        RailsSecurity = {
          prompt = "Review this Rails code for security vulnerabilities and suggest improvements.",
          system_prompt = "You are a Rails security expert. Focus on common Rails security issues like SQL injection, XSS, authorization, and Rails security best practices.",
          description = " Rails Security Review",
        },
        RailsRefactor = {
          prompt = "Refactor this Rails code to follow Rails conventions and best practices.",
          system_prompt = "You are a Rails refactoring expert. Focus on Rails patterns, service objects, concerns, and maintainable Rails architecture.",
          description = " Rails Refactoring",
        },
        
        -- Elixir/Phoenix-specific prompts with Elixir icons
        ElixirExplain = {
          prompt = "Explain this Elixir/Phoenix code, focusing on functional programming concepts, OTP patterns, and Phoenix conventions.",
          system_prompt = "You are an Elixir and Phoenix expert. Explain code with focus on functional programming, pattern matching, Phoenix conventions, and OTP principles.",
          description = " Elixir Code Explanation",
        },
        ElixirOptimize = {
          prompt = "Optimize this Elixir/Phoenix code for performance and best practices. Focus on GenServer efficiency, Ecto query optimization, and Phoenix performance patterns.",
          system_prompt = "You are an Elixir and Phoenix performance expert. Focus on functional programming optimization, GenServer patterns, Ecto efficiency, and Phoenix performance improvements.",
          description = " Elixir Performance Optimization",
        },
        ElixirTest = {
          prompt = "Generate ExUnit tests for this Elixir/Phoenix code following Elixir testing best practices.",
          system_prompt = "You are an Elixir testing expert. Write comprehensive ExUnit tests following Elixir testing conventions, using factories, and testing Phoenix-specific behavior including LiveView.",
          description = " Elixir ExUnit Tests",
        },
        ElixirOTP = {
          prompt = "Review this Elixir code for OTP best practices and suggest improvements for GenServer, Supervisor, and Application design.",
          system_prompt = "You are an OTP and distributed systems expert. Focus on GenServer patterns, Supervisor trees, fault tolerance, and concurrent programming best practices.",
          description = " OTP Design Review",
        },
        ElixirRefactor = {
          prompt = "Refactor this Elixir/Phoenix code to follow Elixir conventions and functional programming best practices.",
          system_prompt = "You are an Elixir refactoring expert. Focus on functional programming patterns, Phoenix contexts, pattern matching, and maintainable Elixir architecture.",
          description = " Elixir Refactoring",
        },
        PhoenixLiveView = {
          prompt = "Review and improve this Phoenix LiveView code for best practices, state management, and real-time features.",
          system_prompt = "You are a Phoenix LiveView expert. Focus on state management, event handling, real-time updates, and LiveView performance patterns.",
          description = " LiveView Optimization",
        },
        EctoOptimize = {
          prompt = "Optimize this Ecto query and schema design for better performance and maintainability.",
          system_prompt = "You are an Ecto and database expert. Focus on query optimization, proper associations, changesets, and database design patterns.",
          description = " Ecto Query Optimization",
        },
        
        -- Git and workflow prompts
        CommitConventional = {
          prompt = "Write a commit message for the change with commitizen convention.",
          system_prompt = "You are a Git expert. Write concise, informative commit messages following conventional commits format.",
          description = " Conventional Commit",
        },
        
        -- Additional development prompts
        APIDesign = {
          prompt = "Review and suggest improvements for this API design.",
          system_prompt = "You are an API design expert. Focus on RESTful principles, consistency, and developer experience.",
          description = " API Design Review",
        },
        DatabaseOptimize = {
          prompt = "Review and optimize this database query or schema design.",
          system_prompt = "You are a database optimization expert. Focus on query performance, indexing, and schema design.",
          description = " Database Optimization",
        },
        Accessibility = {
          prompt = "Review this code for accessibility improvements.",
          system_prompt = "You are an accessibility expert. Focus on WCAG compliance, semantic HTML, and inclusive design.",
          description = " Accessibility Review",
        },
      },
    },
    
    config = function(_, opts)
      local chat = require("CopilotChat")
      chat.setup(opts)
      
      -- Set up your custom keymaps with enhanced descriptions
      vim.keymap.set('n', '<leader>cc', '<CMD>CopilotChatToggle<CR>', { desc = ' Toggle Copilot Chat' })
      vim.keymap.set('n', '<leader>cr', '<CMD>CopilotChatReset<CR>', { desc = ' Reset Copilot Chat' })
      vim.keymap.set('n', '<leader>cs', '<CMD>Copilot setup<CR>', { desc = ' Copilot setup' })
      vim.keymap.set('n', '<leader>c?', '<CMD>Copilot status<CR>', { desc = ' Copilot status' })
      vim.keymap.set('n', '<leader>cp', '<CMD>Copilot panel<CR>', { desc = ' Copilot panel' })
      
      -- Model and agent selection (uses proper CopilotChat commands)
      vim.keymap.set('n', '<leader>cm', function() 
        require("CopilotChat").select_model() 
      end, { desc = ' Select Model' })
      
      -- Quick chat commands with descriptive icons
      vim.keymap.set('v', '<leader>ce', '<CMD>CopilotChatExplain<CR>', { desc = ' Explain selection' })
      vim.keymap.set('v', '<leader>cf', '<CMD>CopilotChatFix<CR>', { desc = ' Fix selection' })
      vim.keymap.set('v', '<leader>co', '<CMD>CopilotChatOptimize<CR>', { desc = ' Optimize selection' })
      vim.keymap.set('v', '<leader>cd', '<CMD>CopilotChatDocs<CR>', { desc = ' Add documentation' })
      vim.keymap.set('v', '<leader>ct', '<CMD>CopilotChatTests<CR>', { desc = ' Generate tests' })
      
      -- Rails-specific commands
      vim.keymap.set('v', '<leader>cre', ':CopilotChat RailsExplain<CR>', { desc = ' Rails Explanation' })
      vim.keymap.set('v', '<leader>cro', ':CopilotChat RailsOptimize<CR>', { desc = ' Rails Optimization' })
      vim.keymap.set('v', '<leader>crt', ':CopilotChat RailsTest<CR>', { desc = ' Rails RSpec Tests' })
      vim.keymap.set('v', '<leader>crs', ':CopilotChat RailsSecurity<CR>', { desc = ' Rails Security Review' })
            vim.keymap.set('v', '<leader>crr', '<CMD>CopilotChatRailsRefactor<CR>', { desc = ' Rails Refactoring' })
      
      -- Elixir/Phoenix specific visual mode commands
      vim.keymap.set('v', '<leader>cee', '<CMD>CopilotChatElixirExplain<CR>', { desc = ' Elixir Code Explanation' })
      vim.keymap.set('v', '<leader>ceo', '<CMD>CopilotChatElixirOptimize<CR>', { desc = ' Elixir Performance Optimization' })
      vim.keymap.set('v', '<leader>cet', '<CMD>CopilotChatElixirTest<CR>', { desc = ' Elixir ExUnit Tests' })
      vim.keymap.set('v', '<leader>cep', '<CMD>CopilotChatElixirOTP<CR>', { desc = ' OTP Design Review' })
      vim.keymap.set('v', '<leader>cer', '<CMD>CopilotChatElixirRefactor<CR>', { desc = ' Elixir Refactoring' })
      vim.keymap.set('v', '<leader>cel', '<CMD>CopilotChatPhoenixLiveView<CR>', { desc = ' LiveView Optimization' })
      vim.keymap.set('v', '<leader>ceq', '<CMD>CopilotChatEctoOptimize<CR>', { desc = ' Ecto Query Optimization' })
      
      -- Additional helpful prompts
      vim.keymap.set('v', '<leader>cR', '<CMD>CopilotChatReview<CR>', { desc = ' Code Review' })
      vim.keymap.set('v', '<leader>cA', ':CopilotChat APIDesign<CR>', { desc = ' API Design Review' })
      vim.keymap.set('v', '<leader>cdb', ':CopilotChat DatabaseOptimize<CR>', { desc = ' Database Optimization' })
      vim.keymap.set('v', '<leader>cac', ':CopilotChat Accessibility<CR>', { desc = ' Accessibility Review' })
      
      -- Git workflow
      vim.keymap.set('n', '<leader>cgc', ':CopilotChat CommitConventional<CR>', { desc = ' Generate Commit Message' })
      
      -- Enable/disable commands
      vim.keymap.set('n', '<leader>cE', '<CMD>Copilot enable<CR>', { desc = ' Enable Copilot' })
      vim.keymap.set('n', '<leader>cD', '<CMD>Copilot disable<CR>', { desc = ' Disable Copilot' })
    end,
  }
}
