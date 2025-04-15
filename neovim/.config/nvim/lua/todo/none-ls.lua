-- none-ls configuration (null-ls fork)

return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "williamboman/mason.nvim",
    },
    config = function()
      local null_ls = require("null-ls")
      
      null_ls.setup({
        debug = false,
        sources = {
          -- Linters
          null_ls.builtins.diagnostics.rubocop,
          null_ls.builtins.diagnostics.haml_lint,
          null_ls.builtins.diagnostics.erb_lint,
          null_ls.builtins.diagnostics.eslint_d,
          null_ls.builtins.diagnostics.jsonlint,
          null_ls.builtins.diagnostics.pylint,
          null_ls.builtins.diagnostics.yamllint,
          
          -- Added linters for functional languages
          null_ls.builtins.diagnostics.hlint,
          null_ls.builtins.diagnostics.credo,
          
          -- Formatters
          null_ls.builtins.formatting.rubocop,
          null_ls.builtins.formatting.prettier.with({
            filetypes = {
              "javascript", 
              "typescript", 
              "css", 
              "scss", 
              "html", 
              "json", 
              "yaml", 
              "markdown",
              "typescriptreact",
              "javascriptreact"
            }
          }),
          null_ls.builtins.formatting.stylua.with({
            extra_args = { "--indent-type", "Spaces", "--indent-width", "2" },
          }),
          null_ls.builtins.formatting.csharpier,
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.isort,
          
          -- Added formatters for functional languages
          null_ls.builtins.formatting.stylish_haskell,
          null_ls.builtins.formatting.elm_format,
          null_ls.builtins.formatting.mix,
          
          -- Code Actions
          null_ls.builtins.code_actions.eslint_d,
          null_ls.builtins.code_actions.gitsigns,
        },
        
        -- Set up format on save with none-ls
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            -- Create an autocommand group for this buffer
            local augroup = vim.api.nvim_create_augroup("LspFormatting_" .. bufnr, {})
            
            -- Get user's format-on-save preference
            local format_on_save = vim.g.format_on_save or false
            
            if format_on_save then
              -- Add auto-format on save
              vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                  vim.lsp.buf.format({ 
                    bufnr = bufnr,
                    filter = function(format_client)
                      -- Use none-ls for formatting when available
                      return format_client.name == "null-ls"
                    end
                  })
                end,
              })
            end
          end
        end,
      })
      
      -- Add keymapping to manually format buffer with none-ls
      vim.keymap.set("n", "<leader>cf", function()
        vim.lsp.buf.format({
          filter = function(client)
            -- Prefer null-ls for formatting
            return client.name == "null-ls"
          end,
          async = true,
        })
      end, { desc = "Format buffer with none-ls" })
      
      -- Add keybinding to toggle format on save
      vim.keymap.set("n", "<leader>uf", function()
        vim.g.format_on_save = not (vim.g.format_on_save or false)
        local status = vim.g.format_on_save and "enabled" or "disabled"
        vim.notify("Format on save " .. status)
      end, { desc = "Toggle format on save" })
    end,
  }
}
