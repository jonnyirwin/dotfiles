# Comprehensive GitHub Copilot Setup Guide

## Overview
Your Neovim configuration now uses **both** official GitHub Copilot and CopilotChat.nvim plugins for maximum AI assistance capabilities:

- **Official `github/copilot.vim`**: Inline code suggestions while typing
- **CopilotChat.nvim**: Interactive AI chat and advanced features

## Plugin Comparison & Why Both?

### Official GitHub Copilot Plugin
**Best for**: Fast inline suggestions, lightweight completions
- ✅ Official GitHub plugin - Most stable and reliable
- ✅ Perfect ghost text implementation 
- ✅ Minimal resource usage
- ❌ No chat interface or advanced interactions

### CopilotChat.nvim Plugin  
**Best for**: AI conversations, code analysis, complex tasks
- ✅ Full conversational AI capabilities
- ✅ Multiple AI models (GPT-4o, Claude, Gemini)
- ✅ Rich context system (`#files`, `#git:staged`, etc.)
- ✅ Pre-built prompts (Explain, Fix, Optimize, Test)
- ❌ More complex setup and heavier resource usage

## Keybindings Reference

### Insert Mode (Inline Suggestions)
| Key | Action | Plugin |
|-----|--------|--------|
| `Ctrl+Y` | Accept full suggestion | Official |
| `Ctrl+Right` | Accept word | Official |
| `Ctrl+Shift+Right` | Accept line | Official |
| `Alt+[` | Previous suggestion | Official |
| `Alt+]` | Next suggestion | Official |
| `Ctrl+E` | Dismiss suggestion | Official |
| `Ctrl+\` | Manual trigger | Official |

### Normal Mode (Management)
| Key | Action | Plugin |
|-----|--------|--------|
| `<leader>cc` | Toggle Copilot Chat | CopilotChat |
| `<leader>cr` | Reset Chat | CopilotChat |
| `<leader>cq` | Close Chat | CopilotChat |
| `<leader>cs` | Copilot Setup | Official |
| `<leader>c?` | Copilot Status | Official |
| `<leader>cp` | Copilot Panel | Official |
| `<leader>cE` | Enable Copilot | Official |
| `<leader>cD` | Disable Copilot | Official |
| `<leader>cm` | Select Model | CopilotChat |
| `<leader>ca` | Select Agent | CopilotChat |

### Visual Mode (Code Analysis)
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>ce` | Explain | Explain selected code |
| `<leader>cf` | Fix | Fix issues in code |
| `<leader>co` | Optimize | Optimize performance |
| `<leader>cd` | Documentation | Add docs |
| `<leader>ct` | Tests | Generate tests |
| `<leader>cv` | Review | Code review |

### Rails-Specific (Visual Mode)
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>cre` | Rails Explain | Rails-focused explanation |
| `<leader>cro` | Rails Optimize | Rails performance optimization |
| `<leader>crt` | Rails Test | Generate RSpec tests |

### Git Integration
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>cgc` | Generate Commit | Create commit message |
| `<leader>cgs` | Commit Staged | Message for staged files |

## Custom Prompts with Visual Enhancements 🎨

Your setup includes beautifully designed custom prompts with Nerd Font icons and Rails-specific capabilities:

### Enhanced Default Prompts
- ** Code Explanation** - Clear, step-by-step code explanations
- ** Code Review** - Comprehensive code quality analysis  
- ** Bug Fix** - Debug and fix code issues
- ** Performance Optimization** - Improve code performance
- ** Documentation** - Add comprehensive documentation
- ** Test Generation** - Create thorough test coverage

### Rails-Specific Prompts 
- ** Rails Code Explanation** - Rails conventions and patterns focus
- ** Rails Performance Optimization** - N+1 queries, ActiveRecord optimization
- ** Rails RSpec Tests** - Rails testing best practices with factories
- ** Rails Security Review** - Security vulnerabilities and Rails-specific issues
- ** Rails Refactoring** - Service objects, concerns, Rails architecture

### Additional Specialized Prompts
- ** API Design Review** - RESTful principles and developer experience
- ** Database Optimization** - Query performance, indexing, schema design  
- ** Accessibility Review** - WCAG compliance and inclusive design
- ** Conventional Commit** - Generate proper commit messages

### Visual Interface Enhancements
The chat interface now features:
- **Beautiful Headers**: ` User ` and ` Copilot ` with working Nerd Font icons
- **Enhanced Window Title**: ` Copilot Chat ` 
- **Helpful Footer**: ` Press q to close, ? for help `
- **Extended Separators**: Clean visual divider lines
- **Icon-Rich Keybindings**: All commands have reliable Nerd Font icons

### Using Custom Prompts
1. **Select code** in visual mode
2. **Use `:CopilotChat PromptName`** (e.g., `:CopilotChat RailsExplain`)
3. **Or use the mapped keybindings** (e.g., `<leader>cre` for Rails Explain)
4. **Enjoy the enhanced visual interface** with clear headers and icons

## Usage Workflows

### 1. Daily Coding (Inline Suggestions)
1. **Start typing** - Official Copilot shows ghost text suggestions
2. **Use `Ctrl+Y`** to accept full suggestions
3. **Use `Ctrl+Right`** to accept just the next word
4. **Use `Alt+]`** to cycle through alternatives
5. **Use `Ctrl+E`** to dismiss unwanted suggestions

### 2. Code Analysis & Learning (Chat)
1. **Select code** in visual mode
2. **Press `<leader>ce`** for detailed explanations
3. **Press `<leader>cv`** for code reviews
4. **Use `<leader>cc`** to open chat for follow-up questions

### 3. Problem Solving (Chat with Context)
```
#buffer
#files:*.rb
#git:staged

How can I optimize this Rails controller for better performance?
```

### 4. Rails Development Workflow
1. **Select Rails code**
2. **Use `<leader>cre`** for Rails-specific explanations
3. **Use `<leader>cro`** for Rails performance optimization
4. **Use `<leader>crt`** to generate RSpec tests

## CopilotChat Context System

### Available Contexts
- `#buffer` - Current buffer content
- `#buffers` - All open buffers  
- `#file:path/to/file` - Specific file
- `#files:*.rb` - Files matching pattern
- `#git:staged` - Staged git changes
- `#git:unstaged` - Unstaged changes
- `#url:https://example.com` - Web content

### Example Usage
```
#files:app/controllers/*.rb
#git:staged

Review these controller changes for Rails best practices and suggest improvements.
```

## Models & Agents

### Available Models (use `<leader>cm`)
- **GPT-4o** - Latest OpenAI model (default)
- **Claude 3.7 Sonnet** - Anthropic's model
- **Gemini 2.0 Flash** - Google's model

### Available Agents (use `<leader>ca`)
- **copilot** - Default general assistant
- **github** - GitHub-specific assistance
- Custom agents from GitHub Marketplace

## Chat Window Controls

### In Chat Window
| Key | Action |
|-----|--------|
| `Tab` | Trigger completion |
| `q` | Close window |
| `Ctrl+R` | Reset chat |
| `Enter` | Submit prompt |
| `Ctrl+Y` | Accept diff |
| `gd` | Show diff |
| `gy` | Yank diff |

## Configuration Options

### File Types
Copilot is enabled for:
- Ruby, Rails files
- JavaScript, TypeScript
- Markdown, YAML, JSON
- Lua configuration files

Disabled for:
- Git commit messages
- Help files

### Performance Settings
- **100ms delay** for inline suggestions
- **Suggestions during completion** enabled
- **Vertical chat layout** at 40% width

## Troubleshooting

### Inline Suggestions Not Working
1. Check authentication: `<leader>c?`
2. Ensure Node.js is installed
3. Try manual trigger: `Ctrl+\`
4. Restart language server: `:Copilot restart`

### Chat Not Working
1. Ensure main Copilot is authenticated
2. Check internet connection
3. Try different model: `<leader>cm`
4. Reset chat: `<leader>cr`

### Conflicts with Completion
- Tab mapping disabled for Copilot
- Uses `Ctrl+Y` instead of `Tab`
- Works alongside blink.cmp without conflicts

## Best Practices

### For Inline Suggestions
- Let Copilot suggest first, then edit
- Use word acceptance (`Ctrl+Right`) for partial adoption
- Cycle through alternatives (`Alt+]`) before dismissing

### For Chat
- Provide specific context with `#` syntax
- Use visual selections for targeted help
- Save important chat sessions
- Use Rails-specific commands for Rails code

### Performance
- Official plugin is always fast
- Chat requires internet connection
- Use contexts judiciously to avoid large requests

## Quick Start

1. **Setup**: `<leader>cs` (first time only)
2. **Status Check**: `<leader>c?`
3. **Start Coding**: Type code, accept suggestions with `Ctrl+Y`
4. **Get Help**: Select code, press `<leader>ce` for explanations
5. **Open Chat**: `<leader>cc` for complex discussions

This dual-plugin setup gives you both lightning-fast inline suggestions and powerful AI conversation capabilities!
