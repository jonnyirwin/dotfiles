  -- LSP configuration

  return {
    {
      "williamboman/mason.nvim",
      config = function()
        require("mason").setup({
          ui = {
            icons = {
              server_installed = "✓",
              server_pending = "➜",
              server_uninstalled = "✗"
            }
          }
        })
      end
    },
    {
      "williamboman/mason-lspconfig.nvim",
      config = function()
        require("mason-lspconfig").setup({
          -- List of servers to automatically install
          ensure_installed = {
            "lua_ls",
            "ts_ls",
            "csharp_ls",
            "ruby_lsp",
            "pyright",
            "html",
            "cssls",
            "jsonls",
          },
          automatic_installation = true,
        })
      end
    },
    {
      "neovim/nvim-lspconfig",
      dependencies = {
        "saghen/blink.cmp",
        "williamboman/mason-lspconfig.nvim"
      },
      config = function()
        -- LSP settings
        local lspconfig = require("lspconfig")
        
        -- Define on_attach function
        local on_attach = function(client, bufnr)
          -- Enable completion triggered by <c-x><c-o>
          vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
        
          -- Buffer local mappings
          local opts = { noremap=true, silent=true, buffer=bufnr }
          
          -- LSP keybindings
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', '<leader>cf', function() vim.lsp.buf.format { async = true } end, opts) -- Fixed: was <leader>f
        end
        
        -- Setup capabilities with blink-cmp
        local capabilities
        if pcall(require, 'blink-cmp.lsp') then
          capabilities = require('blink-cmp.lsp').default_capabilities()
        else
          capabilities = vim.lsp.protocol.make_client_capabilities()
        end
        
        -- Configure Lua server for Neovim development
        lspconfig.lua_ls.setup {
          on_attach = on_attach,
          capabilities = capabilities,
          settings = {
            Lua = {
              diagnostics = {
                globals = { 'vim' }
              },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false
              },
              telemetry = {
                enable = false,
              },
            },
          },
        }
        
        -- Setup other LSP servers
        local servers = { 
        "ts_ls", 
        "csharp_ls", 
        "ruby_lsp",
        "pyright", 
        "html", 
        "cssls", 
        "jsonls",
        "elmls",
        "elixirls",
      }
      
      -- Language-specific settings
      local server_settings = {
        elmls = {
          settings = {
            elm = {
              formatCommand = "elm-format",
              formatOnSave = true,
            }
          }
        },
        elixirls = {
          settings = {
            elixirLS = {
              dialyzerEnabled = true,
              fetchDeps = false,
              enableTestLenses = true,
            }
          }
        }
      }

      for _, lsp in ipairs(servers) do
        local config = {
          on_attach = on_attach,
          capabilities = capabilities,
        }
        
        -- Add language-specific settings if they exist
        if server_settings[lsp] then
          config = vim.tbl_deep_extend("force", config, server_settings[lsp])
        end
        
        lspconfig[lsp].setup(config)
      end
      
      -- Configure diagnostics
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })
    end
  }
}
